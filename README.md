# CSC6890Token

CSC6890Token is a Crowdsale Token developed on the Ethereum platform using Truffle, Solidity, and OpenZeppelin

Versions used:
* Truffle - 4.1.15
* OpenZeppelin - 1.12.0
* Solidity - 0.4.25

_These contracts were adapted from contracts from Crowdbotics and Dapp University_

Crowdbotics: [Tutorial](https://medium.com/crowdbotics/how-to-build-a-simple-capped-crowdsale-token-using-openzeppelin-library-part-1-2789ec642308)

Dapp University:
* [YouTube Tutorial](https://www.youtube.com/watch?v=2IqsgSyA8BQ)
* [Step-by-Step Article](http://www.dappuniversity.com/articles/real-world-ico)

_This repository does not contain the OpenZeppelin library, therefore it is required that the library is added to the project directory before running. Follow the installation instructions below to install the correct version of OpenZeppelin._


## Installation Instructions

_**Truffle v4.1.15** and **OpenZeppelin v1.12.0** are required for these contracts to compile and deploy correctly._

To install the correct version of Truffle, enter the following command:

	npm install -g truffle@4.1.15

To install the correct version of OpenZeppelin, first make sure that you are in the project directory, then enter the following command:

	npm install --prefix ./ openzeppelin-solidity@1.12.0

This will install the OpenZeppelin library for solidity into a directory named _node_modules_ in the project directory.


## Deployment and Execution Instructions

To deploy the CSC6890Token to the Ethereum development network, use truffle to create a local development environment.

While in the project folder, enter following commands:

	truffle compile
    truffle develop
    migrate --reset

_This will compile the contracts, initialize the local development environment, and deploy the contracts._

The following command will initialize an instance of the contract **CSC6890Token**:

	CSC6890Token.deployed("CSC6890Token", "CSC", 18).then((t) => {token = t;})

This will store the instance in an object named token. To view the contract's address, name, and symbol, enter the following commands:

	
    token.address
    token.name
    token.symbol

To transfer funds from one account to another account, enter the following command:

	token.transferFrom(senderAddress, recieverAddress, amount)

A receipt will then be displayed. For example:

	{ tx: '0xb0f4291ac7a3ed5264208160a75737acd420b9ffa0ae96d080f64efc81af5871',
  	  receipt:
   	{ transactionHash: '0xb0f4291ac7a3ed5264208160a75737acd420b9ffa0ae96d080f64efc81af5871',
      transactionIndex: 0,
      blockHash: '0x05e5562f2903c720550aa32770e749c138220d937dd02572ce462536f6c40ffe',
      blockNumber: 3,
      gasUsed: 43392,
      cumulativeGasUsed: 43392,
      contractAddress: null,
      logs: [ [Object] ],
      status: '0x1',
      logsBloom: '0x00000000002000000000000000000000000000000000000000000...' },
  	  logs:
   	[ { logIndex: 0,
        transactionIndex: 0,
        transactionHash: '0xb0f4291ac7a3ed5264208160a75737acd420b9ffa0ae96d080f64efc81af5871',
        blockHash: '0x05e5562f2903c720550aa32770e749c138220d937dd02572ce462536f6c40ffe',
        blockNumber: 3,
        address: '0xf12b5dd4ead5f743c6baa640b0216200e89b60da',
        type: 'mined',
        event: 'Transfer',
        args: [Object] } ] }

To get the balance of an account given an address, enter the following command:

	token.getTokensLeft(accountAddress)

The function will return the balance of the account in a BigNumber format.
