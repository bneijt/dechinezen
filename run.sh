#!/bin/bash
set -e
stack build --fast
export PORT=8080
stack exec dechinezen-exe
