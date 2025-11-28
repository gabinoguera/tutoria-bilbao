using System;
using System.Collections.Generic;

namespace Metro.Validation.Service
{
    // EJERCICIO: Generar documentación XML para esta clase y sus métodos
    public class TarifasService
    {
        private readonly Dictionary<int, decimal> _tarifasBase;

        public TarifasService()
        {
            _tarifasBase = new Dictionary<int, decimal>
            {
                { 1, 1.50m }, // Zona A
                { 2, 1.80m }, // Zona B
                { 3, 1.90m }  // Zona C
            };
        }

        // EJERCICIO: Documentar este método explicando el cálculo
        public decimal CalcularPrecioViaje(int zonaOrigen, int zonaDestino, string tipoPerfil)
        {
            int zonasAtravesadas = Math.Abs(zonaDestino - zonaOrigen) + 1;
            
            if (!_tarifasBase.ContainsKey(zonasAtravesadas))
            {
                throw new ArgumentException("Trayecto no válido");
            }

            decimal precioBase = _tarifasBase[zonasAtravesadas];

            // Aplicar descuentos
            if (tipoPerfil == "JOVEN")
            {
                return precioBase * 0.5m; // 50% descuento
            }
            else if (tipoPerfil == "JUBILADO")
            {
                return precioBase * 0.25m; // 75% descuento
            }

            return precioBase;
        }

        // EJERCICIO: Generar commit semántico para este nuevo método
        public bool EsHorarioPunta(DateTime fecha)
        {
            // Lógica simple para ejemplo
            int hora = fecha.Hour;
            return (hora >= 7 && hora <= 9) || (hora >= 18 && hora <= 20);
        }
    }
}
