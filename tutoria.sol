pragma solidity ^0.4.0;
contract Tutoria {

    struct datosTutoria{
        address profesor;
        address alumno;
        string materia;
        bytes32 hash;
        uint estaConf;
        uint estaCancel;
    }
    
    mapping (address => datosTutoria) tutorias;

    function solicitar (address prof, string mat) public{
        require(prof != msg.sender);
        datosTutoria tut = tutorias[msg.sender];
	    tut.profesor = prof;
	    tut.alumno = msg.sender;
        tut.materia = mat;
    	tut.hash = keccak256(tut.profesor, tut.alumno, tut.materia);
    	tut.estaConf = 0;
    	tut.estaCancel = 0;
    	
    }
    
    function getHash(address k) public view returns (bytes32) {
        return tutorias[k].hash;
    }

    function getProfesor(address llave) public view returns(address){
        return tutorias[llave].profesor;
    }
    function getMateria(address llave) public view returns(string){
        return tutorias[llave].materia;
    }
    
    function getAlumno(address llave) public returns (address) {
        return tutorias[llave].alumno;
    }
    
    function confirmar(address llave) public returns (uint) {
        //requires
        require(tutorias[llave].profesor == msg.sender);
        require(tutorias[llave].estaCancel == 0);
        require(tutorias[llave].estaConf == 0);
        
        return tutorias[llave].estaConf = 1;
    }
    
    function estaConfirmado(address key) public returns (uint){
        
        return tutorias[key].estaConf;
    }

    function cancelar(address llave) public returns (uint) {
        
	    require(tutorias[llave].alumno == msg.sender); 
 
	    require(tutorias[llave].estaCancel == 0);
  
	    require(tutorias[llave].estaConf == 0);
	    
	    return tutorias[llave].estaCancel = 1;
    }
    
    function estaCancelado(address llave) public view returns (uint){
        return tutorias[llave].estaCancel;
    
    }
}