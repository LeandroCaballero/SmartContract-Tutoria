pragma solidity ^0.4.0;
contract Tutoria {
    
    struct datosTutoria{
        address profesor;
        address alumno;
        string materia;
        bool estaConf;
        bool estaCancel;
    }
    
    
    function pedir (address prof, string mat) public{
        require(prof != msg.sender);
        datosTutoria.alumno = msg.sender;
        datosTutoria.estaConf = false;
        datosTutoria.estaCancel = false;
        datosTutoria.profesor = prof;
        datosTutoria.materia = mat;
    }
    
    function getProfesor() public returns(address){
        return datosTutoria.profesor;
    }
    function getMateria() public returns(string){
        return datosTutoria.materia;
    }
    
    function getAlumno() public returns (address) {
        return datosTutoria.alumno;
    }
    
    function confirmar() public returns (uint) {
        datosTutoria.estaConf = true;
    }
    
    function estaConfirmado() public returns (uint){
        require(datosTutoria.estaConf == true);
        return datosTutoria.estaConf;
    }
}