#!/bin/bash
function cargo(){
    curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
}
