.PHONY: install chain compile deploy dev help

help:
	@echo "Available commands:"
	@echo "  make install   - Install frontend dependencies"
	@echo "  make chain     - Start local blockchain (Anvil)"
	@echo "  make compile   - Compile smart contracts"
	@echo "  make deploy    - Deploy smart contracts to local chain"
	@echo "  make dev       - Run frontend development server"

install:
	cd frontend && npm install

chain:
	anvil

compile:
	cd Foundry_Contracts && forge compile

deploy:
	cd Foundry_Contracts && forge script script/Deploy.s.sol:DeployWithData --fork-url http://localhost:8545 --broadcast --interactive

dev:
	cd frontend && npm run dev
