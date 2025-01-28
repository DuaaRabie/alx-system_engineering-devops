#!/usr/bin/python3
""" Export data in the JSON format """
import json
import requests
from sys import argv

if __name__ == "__main__":
    url = "https://jsonplaceholder.typicode.com/"
    user = requests.get(url + "users/{}".format(argv[1])).json()
    todos = requests.get(url + "todos", params={"userId": argv[1]}).json()

    with open("{}.json".format(argv[1]), "w", newline='') as jsonfile:
        json.dump(
            {argv[1]: [{"task": task.get("title"),
                        "completed": task.get("completed"),
                        "username": user.get("username")} for task in todos]},
            jsonfile)
