pragma solidity ^0.4.0;
contract Tutoria {
    address profesor;
    address alumno;
    string materia;
    
    constructor (address prof, string mat) public{
        alumno = msg.sender;
        require(prof != msg.sender);
        profesor = prof;
        materia = mat;
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