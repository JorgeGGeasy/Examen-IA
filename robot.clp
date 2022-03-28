(deffacts robot
    (lineaPedido naranjas 4 manzanas 2 caquis 0 uva 1 almacen naranjas 0 manzanas 0 caquis 0 uva 0)
    (pedido naranjas 4 manzanas 2 caquis 0 uva 1)
)

(defrule acabar
    (declare (salience 150))
    (lineaPedido naranjas ?naranjas manzanas ?manzanas caquis ?caquis uva ?uva almacen $?almacen)
    (pedido naranjas ?naranjas manzanas ?manzanas caquis ?caquis uva ?uva)
    =>
    (printout t "He acabado" crlf)
    (halt)

)

(defrule acabar2
    (declare (salience 100))
    (lineaPedido naranjas ?naranjas manzanas ?manzanas caquis ?caquis uva ?uva almacen naranjas 0 manzanas 0 caquis 0 uva 0)
    (not(pedido naranjas ?naranjas manzanas ?manzanas caquis ?caquis uva ?uva))
    =>
    (printout t "He acabado" crlf)
    (halt)

)
