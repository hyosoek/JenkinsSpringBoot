#!/bin/bash
test $(curl localhost:8082/?data=10) -eq 2

