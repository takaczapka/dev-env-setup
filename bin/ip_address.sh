#!/bin/sh

ping -qc 1 $1 | head -n 1 | grep -oE '[0-9]+\.[0-9]+\.[0-9]+\.[0-9]+'