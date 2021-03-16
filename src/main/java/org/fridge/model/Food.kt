package org.fridge.model

import java.util.*

data class Food(
        var id: Long = 0,
        var foodName: String = "",
        var productionDate: Date = Date(),
        var shelfLife: Long = 0,
        var freezer: Long = 0,
        var level: Long = 0,
        var defrost: Long = 0,
        var fridgeId: Long = 0,
        var weight: Float = 0.0f,
)