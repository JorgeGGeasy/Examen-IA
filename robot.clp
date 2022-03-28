(deffacts robot
    (lineaPedido palet naranjas 0 palet manzanas 0 palet caquis 0 palet uva 0 almacen palet naranjas 5 palet manzanas 4 palet caquis 2 palet uva 2)
    (pedido palet naranjas 2 palet manzanas 2 palet caquis 0 palet uva 1)
    (transporte 3)
)

(defrule acabar
    (declare (salience 150))
    (lineaPedido naranjas ?naranjas manzanas ?manzanas caquis ?caquis uva ?uva almacen $?almacen)
    (pedido naranjas ?naranjas manzanas ?manzanas caquis ?caquis uva ?uva)
    =>
    (printout t "He acabado" crlf)
    (halt)

)

(defrule mover_unPoco
    (declare (salience 120))
    (lineaPedido $?preLinea palet ?fruta ?frutaLinea $?postLinea almacen naranjas ?naranjasA manzanas ?manzanasA caquis ?caquisA uva ?uvaA)
    (pedido $?preP palet ?fruta ?frutaP $?postP)
    (transporte ?numeroTransporte)
    (test (and (>(+ ?naranjas ?naranjasA) ?naranjasP)  (>(+ ?manzanas ?manzanasA) ?manzanasP) (>(+ ?caquis ?caquisA) ?caquisP) (>(+ ?uva ?uvaA) ?uvaP)))
    (test (> ?numeroTransporte ?naranjasP))
    (test (<> ?naranjas ?naranjasP))
    =>
    (assert(lineaPedido naranjas ?naranjasP manzanas ?manzanas caquis ?caquis uva ?uva almacen naranjas (- ?naranjasA ?naranjasP) manzanas ?manzanasA caquis ?caquisA uva ?uvaA))
)

(defrule mover_todo
    (declare (salience 120))
    (lineaPedido naranjas ?naranjas manzanas ?manzanas caquis ?caquis uva ?uva almacen naranjas ?naranjasA manzanas ?manzanasA caquis ?caquisA uva ?uvaA)
    (pedido naranjas ?naranjasP manzanas ?manzanasP caquis ?caquisP uva ?uvaP)
    (transporte ?numeroTransporte)
    (test (and (>(+ ?naranjas ?naranjasA) ?naranjasP)  (>(+ ?manzanas ?manzanasA) ?manzanasP) (>(+ ?caquis ?caquisA) ?caquisP) (>(+ ?uva ?uvaA) ?uvaP)))
    (test (< ?numeroTransporte ?naranjasP))
    (test (<> ?naranjas ?naranjasP))
    =>
    (assert(lineaPedido naranjas (+ ?naranjas ?numeroTransporte) manzanas ?manzanas caquis ?caquis uva ?uva almacen naranjas (- ?naranjasA ?numeroTransporte) manzanas ?manzanasA caquis ?caquisA uva ?uvaA))
)

(defrule acabar2
    (declare (salience 100))
    (lineaPedido naranjas ?naranjas manzanas ?manzanas caquis ?caquis uva ?uva almacen $?almacen)
    (not(pedido naranjas ?naranjas manzanas ?manzanas caquis ?caquis uva ?uva))
    
    =>
    (printout t "No hay existencias" crlf)
    (halt)

)


