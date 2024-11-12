#!/bin/bash
test $(curl localhost:8082?a=1\&b=2) -eq 2

