/* La estructura mas importante para este proyecto es el par Req-Vs (Requerimiento-Variables)
    req(C,S,T,N) -> Class, Subject, Teacher, N - length del array 
El horario se declara como una tabla donde cada casilla tiene un numero (Lunes 8:30 = 1, Lunes 10:00 2, ...) y 
cada req tendra un varios numeros que le indicara cual es su horario (Puesto de manera ascendente)
- Los num asignados a un profesor tienen que ser todos distintos (asi no da 2 clases a la vez)
- Por defecto cada clase de una asignatura se imparte en dias distintos (Excepcion de asignaturas que ocupen mas de un bloque)
- Un grupo no puede tener 2 clases en la misma hora

RESTRICCIONES DE ASIGNATURAS
- Hay que repartir las horas (No hay 2 clases de la misma en un mismo dia)
- No hay 2 lecciones a la misma hora (En los arrays/slots de C,S,T,N no se repiten num)

ALGUNAS DEFINICIONES
- coupling se encuentra en la definicion de req donde indica la clase y 
  las sesiones de esta que van juntas (ocupan +1h)
        coupling('1a', deu, 2, 3) -> La sesiones 2 y 3 de la asig deu en 1a van seguidas
        
- room_alloc (r1, '1a', deu, 0) -> asigna una sesion de una asig en concreto a un aula especial 


*/

:- use_module(library(clpfd)). % Libreria de op aritmeticas

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

% Metemos en una lista de [req(C,S,T,N)] todos los requisitos que queremos meter en el horario y le damos una lista/slot segun N
requirements(Rs):-
    Goal = class_subject_teacher_times(Class, Subject, Teacher, Number),
    setof(req(Class,Subject,Teacher,Number), Goal, Rs0),
    maplist(req_with_slot, Rs0, Rs).

req_with_slots(R, R-Slots):- R = req(_,_,_,N), length(Slots, N).

% Obtener las lista de todos los grupos
classes(Classes) :-
        setof(C, S^N^T^class_subject_teacher_times(C,S,T,N), Classes).

% Obtener la lista de todos los profesores
teachers(Teachers) :-
        setof(T, C^S^N^class_subject_teacher_times(C,S,T,N), Teachers).

% Obtener las aulas especiales
rooms(Rooms) :-
        findall(Room, room_alloc(Room,_C,_S,_Slot), Rooms0),
        sort(Rooms0, Rooms).

% Nos da la lista de los valores de un slot (Ps = Req(...)-Slot)
pairs_slots(Ps, Vs) :-
        pairs_values(Ps, Vs0),
        append(Vs0, Vs).

requirements_variables(Rs, Vars) :-
        requirements(Rs),                                % Inicializo la lista de requisitos
        pairs_slots(Rs, Vars),                           % 
        slots_per_week(SPW),                             % Captura el numero de casillas por semana (35)
        Max #= SPW - 1,                                  % Inicializo Max
        Vars ins 0..Max,                                 % Inicializo el dominio de las variables
        maplist(constrain_subject, Rs),                  % Aplicar las restricciones de asignatura a todas
        classes(Classes),                                % Obtener las clases
        teachers(Teachers),                              % Obtener los profesores
        rooms(Rooms),                                    % Obtener aulas especiales
        maplist(constrain_teacher(Rs), Teachers),        % Aplicas las restricciones de Profesores a las asignaturas
        maplist(constrain_class(Rs), Classes),
        maplist(constrain_room(Rs), Rooms).


% Modulo del slot (Num / slotPDay)
slot_quotient(S, Q) :-
        slots_per_day(SPD),
        Q #= S // SPD.

% Restriccion de clases acopladas (los valores de las sesiones deben ser seguidas) -> Sesion 2 y 3 juntas => 2 = 6, 3 = 7 PE
slots_couplings(Slots, F-S) :-
        nth0(F, Slots, S1), % nth0 te da el index (F) que corresponde al elemento (S1) en una lista (Slots)
        nth0(S, Slots, S2),
        S2 #= S1 + 1.

% Elimina de la lista el valor en el index indicado en Ws
list_without_nths(Es0, Ws, Es) :-
        phrase(without_(Ws, 0, Es0), Es).

% Comprobar que son todos son diferentes en F
all_diff_from(Vs, F) :- maplist(#\=(F), Vs).

% Restricciones de asignatura con su slot/array
constrain_subject(req(Class,Subj,_Teacher,_Num)-Slots) :-
        strictly_ascending(Slots), % break symmetry            % Num del array en ascendente
        maplist(slot_quotient, Slots, Qs0),                    % Cociente a todos los slot del horario (Dar un num a cada col (dia) del horario)
        findall(F-S, coupling(Class,Subj,F,S), Cs),            % Encuentra las asig que ocupan mas de 1 h = Cs (Par F-S -> 2 sesiones seguidas)
        maplist(slots_couplings(Slots), Cs),                   % Aplica las restriccion de sesiones seguidas a Cs
        pairs_values(Cs, Seconds0),                            % Nos quedamos con el valor de los pares de Cs (clases acopladas)
        sort(Seconds0, Seconds),                               % Ordenamos los valores de los pares
        list_without_nths(Qs0, Seconds, Qs),                   % Elimina los 2 para cumplir la restriccion 
        strictly_ascending(Qs).                                % Ordenar ascendente a Qs (clases acopladas)


% Restricciones del profesor en sus asignaturas
constrain_teacher(Rs, Teacher) :-
        tfilter(teacher_req(Teacher), Rs, Sub),                % Filtrar los profesores (no sabemos como se hace)
        pairs_slots(Sub, Vs),                                  % Obtener el horario del profesor
        all_different(Vs),                                     % Asegurar que el horario no se solapa
        findall(F, teacher_freeday(Teacher, F), Fs),           % Buscar los dias libres del profe
        maplist(slot_quotient, Vs, Qs),                        % Sacamos los dias que trabajará
        maplist(all_diff_from(Qs), Fs).                        % Todos las clases puestas son distintas al dia libre

% Restricciones de las clases
constrain_class(Rs, Class) :-
        tfilter(class_req(Class), Rs, Sub),
        pairs_slots(Sub, Vs),
        all_different(Vs),
        findall(S, class_freeslot(Class,S), Frees),           % Sacar las horas libres
        maplist(all_diff_from(Vs), Frees).                    % Comprobar que todos los slots del horario son distintos a las horas marcadas como libres





        
        


