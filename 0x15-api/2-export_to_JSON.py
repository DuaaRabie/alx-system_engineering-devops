#!/usr/bin/python3
""" Export data in the JSON format """
import json
import requests
from sys import argv

if __name__ == "__main__":
    url = "https://jsonplaceholder.typicode.com/"

    # Fetch user data (using the provided user ID)
    user = requests.get(url + "users/{}".format(argv[1])).json()

    # Fetch tasks data for the specific user (using the user ID)
    todos = requests.get(url + "todos", params={"userId": argv[1]}).json()

    # Create a dictionary to hold the user data in the required format
    user_data = {
        argv[1]: [{
            "task": task.get("title"),
            "completed": task.get("completed"),
            "username": user.get("username")
        } for task in todos]
    }

    # Write the data to a JSON file named after the user ID
    with open("{}.json".format(str(argv[1])), "w") as jsonfile:
        json.dump(user_data, jsonfile)
