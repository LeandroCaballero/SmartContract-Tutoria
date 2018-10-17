let Block = require("./bloque")


class BlockChain {
    constructor(genesis) {
        this.chain = [this.createFirstBlock(genesis)];
        this.zero_count = 3;
    }
    createFirstBlock(genesis) {
        return new Block(0, genesis);
    }
    getLastBlock() {
        return this.chain[this.chain.length - 1];
    }
    addBlock(data) {
        let prevBlock = this.getLastBlock();
        let block = new Block(prevBlock.index + 1, data, prevBlock.hash)
        block.minar(this.zero_count);
        //console.log('MINADO!' + block.hash + 'con nonce' + block.nonce)
        this.chain.push(block); 
    }
    // validar() {
    //     for (let i = 1; i < this.chain.length; i++) {
    //         let prevBlock = this.chain[i - 1];
    //         let currBlock = this.chain[i];

    //         if (currBlock.previousHash != prevBlock.hash)
    //             return false;

    //         if (currBlock.createHash() != currBlock.hash)
    //             return false;
    //     }
    //     return true;
    // }

}


//block = new Block(0, 'prueba');

//console.log(JSON.stringify(block, null, 2));



module.exports = BlockChain;