select v.vino_nombre, v.zona_origen, c.anio, form.formato_capacidad
from
    vinos_venta vv
    join cosechas c on vv.cosecha_id = c.cosecha_id
    join formatos form on vv.formato_id = form.formato_id
    join vinos v on c.vino_id = v.v