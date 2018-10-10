pragma solidity ^0.4.0;
contract Tutoria {

    struct datosTutoria{
        address profesor;
        address alumno;
        string materia;
        bool estaConf;
        bool estaCancel;
    }
    
    mapping (address => datosTutoria) tutorias;

    function solicitar (address prof, string mat) public{
        datosTutoria tut = tutorias[msg.sender];
	    tut.profesor = prof;
	    tut.alumno = msg.sender;
    	require(prof != msg.sender);
    	tut.estaConf = false;
    	tut.estaCancel = false;
    	tut.materia = mat;
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
    
    function confirmar(address llave) public returns (bool) {
        datosTutoria t = tutorias[llave];
        require (msg.sender == t.profesor);
        
        t.estaConf = true;
        return t.estaConf;
    }
    
    function estaConfirmado() public returns (bool){
        require(tutorias[msg.sender].estaConf == true);

        return tutorias[msg.sender].estaConf;
    }

    function cancelar(address llave) public returns (bool) {
  
	    require(tutorias[llave].alumno == msg.sender); 
 
	    require(tutorias[llave].estaCancel == false);
  
	    require(tutorias[llave].estaConf == false);
	    
	    return tutorias[llave].estaCancel = true;
    }
    
    function estaCancelado(address llave) public view returns (bool){
        return tutorias[llave].estaCancel;
    
    }
}