#!/bin/bash
for init in /setup/init*; do
	bash "$init"
done
