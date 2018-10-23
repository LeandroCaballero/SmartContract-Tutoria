pragma solidity ^0.4.0;
import "remix_test.sol";
import "./tutoria.sol";

contract tutoriatest {
    Tutoria tutoriaParaTest;
    
    function debeCrearUnaTutoria () {
        address profesor = 0x14723a09acff6d2a60dcdf7aa4aff308fddc160c;
        string memory materia = "Paradigma";
        
        tutoriaParaTest = new Tutoria(profesor,materia);
        
        Assert.equal(tutoriaParaTest.getProfesor(),profesor, "Deberia obtener el profesor");
        Assert.equal(tutoriaParaTest.getMateria(), "Paradigma", "Deberia obtener la materia");
        Assert.equal(tutoriaParaTest.getAlumno(), alumno, "Deberia obtener el alumno");
    }
}

//Node
//2-Web3 = require('web3')
//3-web3 = new Web3(new Web3.providers.HttpProvider("http://localhost:8545"));
//4-web3.eth.getAccounts(console.log)
//5-code = fs.readFileSync('Tutoria.sol').toString() //Su archivo del contrato inteligente
//5.2 - solc = require('solc')
//6-compiledCode = solc.compile(code)
//--Obtener byteCode y abi
//7-abiDefinition = JSON.parse(compiledCode.contracts[':Tutoria'].interface) //Su contrato inteligente
//8-byteCode = compiledCode.contracts[':Tutoria'].bytecode //Su contrato inteligente
//9-TutoriaContract = new web3.eth.Contract(abiDefinition,{data: byteCode, from: web3.eth.accounts[0], gas: 4700000})
//10-TutoriaContract.deploy({data:byteCode}).send({from:'',gas: 6721975, gasPrice: '1000'});
//instancia
//myContract = new web3.eth.Contract(abiDefinition,'contrato-address', {data:byteCode,gasPrice:'20000000000'});

//ganache-cli --account="0x27f0155807845cc491d3bb373c05bdd2e4ef81e57dd196598ef8659496f24e61,100000000000000000000" --account="0xf1fa60abff2c1271150a05096db17315f1c8003ee5c26ebfe6770c3380afff10,100000000000000000000" --account="0x23c260d8dd465d621dd6232402d5ae7ff0527091641cf2fddc20ba6a1ff8e514,100000000000000000000" --account="0x1c408a94fe839fefbb8b33293e6000ae21da73755981e2262d44ce8ed022fa98,100000000000000000000" --account="0x7bf027473533da3b0abb538cbc8f60b1fde758d1981c476568b8bd934d770cae,100000000000000000000" --account="0x0ee2395be9b0eb5c767d6bdbf5f1071bb7a56b3df8efb0934bd0dc4b9e74dc5e,100000000000000000000" --account="0x65e544cc1afc728574c60010981cf7bada7d29dea6ff98ff3638fcf55eb1353e,100000000000000000000" --account="0x03a8fb638d0c6c8de6c2c24320b3e527e5f090aef9613614b74efaabebbc6b3e,100000000000000000000" --account="0x4138efa49c633ec3a40299b82ab7fa709499fef86cc7c2518366a9167475a690,100000000000000000000" --account="0x5f0a4d331f568e7ba627e6b47e3d0a57ce80e10f7afbe6142d79ad6ac03de24c,100000000000000000000" 