#!/bin/bash
test $(curl localhost:8080/?data=10) -eq 2

