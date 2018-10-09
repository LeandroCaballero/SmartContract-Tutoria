pragma solidity ^0.4.0;
contract Tutoria {
    address profesor;
    address alumno;
    string materia ="Paradigma";
    
    constructor (string prof, string mat) public{
        alumno= msg.sender;
        prof = prof;
        materia = materia;
    }
    
    function getProfesor() public returns(address){
        return profesor;
    }
    function getMateria() public returns(string){
        return materia;
    }
    
    function getAlumno() public returns (address) {
        return alumno;
    }
}