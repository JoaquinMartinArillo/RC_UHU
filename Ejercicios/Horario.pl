/* La estructura mas importante para este proyecto es el par Req-Vs (Requerimiento-Variables)
    req(C,S,T,N) -> Class, Subject, Teacher, N - length del array 
El horario se declara como una tabla donde cada casilla tiene un numero (Lunes 8:30 = 1, Lunes 10:00 2, ...) y 
cada req tendra un varios numeros que le indicara cual es su horario (Puesto de manera ascendente)
- Los num asignados a un profesor tienen que ser todos distintos (asi no da 2 clases a la vez)
- Por defecto cada clase de una asignatura se imparte en dias distintos (Excepcion de asignaturas que ocupen mas de un bloque)
- Un grupo no puede tener 2 clases en la misma hora
