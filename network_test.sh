#!/bin/bash
HOST="8.8.8.8"

ping -c 3 "$HOST" >/dev/null && echo "Network OK" || echo "Network DOWN"

