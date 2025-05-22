/* La estructura mas importante para este proyecto es el par Req-Vs (Requerimiento-Variables)
    req(C,S,T,N) -> Class, Subject, Teacher, N - length del array 
El horario se declara como una tabla donde cada casilla tiene un numero (Lunes 8:30 = 1, Lunes 10:00 2, ...) y 
cada req tendra un varios numeros que le indicara cual es su horario (Puesto de manera ascendente)
- Los num asignados a un profesor tienen que ser todos distintos (asi no da 2 clases a la vez)
- Por defecto cada clase de una asignatura se imparte en dias distintos (Excepcion de asignaturas que ocupen mas de un bloque)
- Un grupo no puede tener 2 clases en la misma hora
*/

slots_per_week(35).
slots_per_day(7).

class_subject_teacher_times('1a', deu, sjk1, 4).
class_subject_teacher_times('1a', mat, mat1, 5).
class_subject_teacher_times('1a', eng, anj1, 3).
class_subject_teacher_times('1a', h, zgo1, 2).
class_subject_teacher_times('1a', geo, geo1, 2).
class_subject_teacher_times('1a', ch, kem1, 2).
class_subject_teacher_times('1a', bio, bio1, 2).
class_subject_teacher_times('1a', ph, fiz1, 2).
class_subject_teacher_times('1a', f, rai1, 2).
class_subject_teacher_times('1a', lat, atvz1, 3).

requirements(Rs):-
    Goal = class_subject_teacher_times(Class, Subject, Teacher, Number),
    setof(req(Class,Subject,Teacher,Number), Goal, Rs0),
    maplist(req_with_slot, Rs0, Rs).

req_with_slots(R, R-Slots):- R = req(_,_,_,N), length(Slots, N).


