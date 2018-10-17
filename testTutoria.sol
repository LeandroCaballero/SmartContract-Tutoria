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