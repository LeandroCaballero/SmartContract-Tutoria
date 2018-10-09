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