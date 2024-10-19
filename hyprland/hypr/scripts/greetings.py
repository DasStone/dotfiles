#!/usr/bin/python3

import random

greetings = [
    "Hey there, Adrian. The journey continues!",
    "Here again Adrian? Ready for the next stop?",
    "Hey there, Adrian. Ready for departue?",
    "Full steam ahead, Adrian!",
    "Welcome aboard, Adrian!",
]

def construct_train():
    num_wagons = random.randint(0, 10)
    return "🚂" + "🚃" * num_wagons


print(random.choice([random.choice(greetings), construct_train()]))
