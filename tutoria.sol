pragma solidity ^0.4.0;
contract Tutoria {

    struct datosTutoria{
        address profesor;
        address alumno;
        string materia;
        uint256 hash;
        uint estaConf;
        uint estaCancel;
    }
    
    mapping (uint256 => datosTutoria) tutorias;

    function solicitar (address prof, string mat) public returns (uint256){
        require(prof != msg.sender);
        uint256 v = uint256 (keccak256(prof, msg.sender, mat,  block.timestamp, block.difficulty));
        
        datosTutoria tut = tutorias[v];
	    tut.profesor = prof;
	    tut.alumno = msg.sender;
        tut.materia = mat;
    	tut.hash = v;
    	tut.estaConf = 0;
    	tut.estaCancel = 0;
    	
    	return v;
    }
    
    function getHash(uint256 k) public view returns (uint256) {
        return tutorias[k].hash;
    }

    function getProfesor(uint256 llave) public view returns(address){
        return tutorias[llave].profesor;
    }
    function getMateria(uint256 llave) public view returns(string){
        return tutorias[llave].materia;
    }
    
    function getAlumno(uint256 llave) public returns (address) {
        return tutorias[llave].alumno;
    }
    
    function confirmar(uint256 llave) public returns (uint) {
        //requires
        require(tutorias[llave].profesor == msg.sender);
        require(tutorias[llave].estaCancel == 0);
        require(tutorias[llave].estaConf == 0);
        
        return tutorias[llave].estaConf = 1;
    }
    
    function estaConfirmado(uint256 key) public returns (uint){
        
        return tutorias[key].estaConf;
    }

    function cancelar(uint256 llave) public returns (uint) {
        
	    require(tutorias[llave].alumno == msg.sender); 
 
	    require(tutorias[llave].estaCancel == 0);
  
	    require(tutorias[llave].estaConf == 0);
	    
	    return tutorias[llave].estaCancel = 1;
    }
    
    function estaCancelado(uint256 llave) public view returns (uint){
        return tutorias[llave].estaCancel;
    
    }
}