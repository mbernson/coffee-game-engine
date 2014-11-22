Ld30.entitiesColliding = (e1, e2) ->
    e1_center =
        x: e1.x / 2
        y: e1.y / 2

    e2_center =
        x: e2.x / 2
        y: e2.y / 2

    return !(e1_center.x + e1.x / 2 < e2_center.x - e2.x / 2 ||
             e1_center.y + e1.y / 2 < e2_center.y - e2.y / 2 ||
             e1_center.x - e1.x / 2 > e2_center.x + e2.x / 2 ||
             e1_center.y - e1.y / 2 > e2_center.y + e2.y / 2)
