object cuentaCorriente {
    var property saldo = 0

    method depositar(monto) {
        saldo += monto
    }

    method extraer(monto) {
        self.validarExtraccion(monto)
        saldo -= monto
    }

    method validarExtraccion(monto) {
        if (monto > saldo) self.error("El saldo " + saldo + "es insuficiente para el monto " + monto)
    }

    method tieneSaldoSuficiente(monto) {
        return saldo >= monto
    }
}

object cuentaConGastos {
    var property saldo = 0
    var property costoXOperacion = 0

    method depositar(monto) {
        saldo += (monto - costoXOperacion).max(0)
    }

    method extraer(monto) {
        saldo -= monto
    }

    method tieneSaldoSuficiente(monto) {
        return saldo >= monto
    }
}

object cuentaCombinada {
    var property cuentaPrimaria = cuentaCorriente
    var property cuentaSecundaria = cuentaConGastos

    method saldo() {
        return cuentaPrimaria.saldo() + cuentaSecundaria.saldo()
    }

    method depositar(monto) {
        cuentaPrimaria.depositar(monto)
    }

    method extraer(monto) {
        (if (cuentaPrimaria.tieneSaldoSuficiente(monto)) cuentaPrimaria else cuentaSecundaria).extraer(monto)
    }

    method tieneSaldoSuficiente(monto) {
        return cuentaPrimaria.saldo() >= monto or cuentaSecundaria.saldo() >= monto
    }
}