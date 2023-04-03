#!/bin/bash
echo -e "\n~~~~~ Number Guess ~~~~~\n"

PSQL="psql --username=freecodecamp --dbname=number_guess -t --no-align -c"

NUMBER_GUESS_LOOP(){
  # generate secret
  SECRET_NUMBER=$(( RANDOM % 1000 + 1))
  echo $SECRET_NUMBER

  echo -e "\nGuess the secret number between 1 and 1000:"
  GUESSES_COUNT=0

  read NUMBER_GUESSED
  (( GUESSES_COUNT++ ))
 
  #  until solved
  while [[ ! $NUMBER_GUESSED = $SECRET_NUMBER ]]
  do
    # if not integer
    if [[ ! $NUMBER_GUESSED =~ ^[0-9]+$ ]]
    then
      echo -e "\nThat is not an integer, guess again:"
    else
      if (( NUMBER_GUESSED < SECRET_NUMBER ))
      then
        echo -e "\nIt's lower than that, guess again:"

      elif [[ $NUMBER_GUESSED -gt $SECRET_NUMBER ]]
      then
        echo -e "\nIt's higher than that, guess again:"
      fi
    fi

    read NUMBER_GUESSED
    (( GUESSES_COUNT++ ))
    
  done
}


echo -e "\nEnter your username:"
read USER_NAME

# get user_id
USER_ID=$($PSQL "SELECT user_id FROM users WHERE name = '$USER_NAME' ")

# if found
if [[ $USER_ID ]]
then
  # get best_game, games_played, name
  BEST_GAME=$($PSQL "SELECT best_game FROM users WHERE user_id = $USER_ID")
  GAMES_PLAYED=$($PSQL "SELECT games_played FROM users WHERE user_id = $USER_ID")
  NAME=$($PSQL "SELECT name FROM users WHERE user_id = $USER_ID")

  echo -e "\nWelcome back, $NAME! You have played $GAMES_PLAYED games, and your best game took $BEST_GAME guesses."

  NUMBER_GUESS_LOOP
  
  if [[ $GUESSES_COUNT -lt $BEST_GAME ]]
  then
    BEST_GAME=$GUESSES_COUNT
  fi

else 
  # insert name
  INERT_USER_RESULT=$($PSQL "INSERT INTO users(name, games_played) VALUES('$USER_NAME', 0) ")
  echo -e "\nWelcome, $USER_NAME! It looks like this is your first time here."

  NUMBER_GUESS_LOOP

  BEST_GAME=$GUESSES_COUNT
fi

# solved
# update user
UPDATE_USER_RESULT=$($PSQL "UPDATE users SET games_played = $GAMES_PLAYED + 1, best_game = $BEST_GAME WHERE name = '$USER_NAME'")
echo -e "\nYou guessed it in $GUESSES_COUNT tries. The secret number was $SECRET_NUMBER. Nice job!"


