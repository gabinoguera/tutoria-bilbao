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

        /// <summary>
        /// Calcula el precio de un viaje en el Metro de Bilbao considerando las zonas atravesadas y el perfil del usuario.
        /// </summary>
        /// <param name="zonaOrigen">Zona de la estación de origen (1-3).</param>
        /// <param name="zonaDestino">Zona de la estación de destino (1-3).</param>
        /// <param name="tipoPerfil">Perfil del usuario: "JOVEN", "JUBILADO" o cualquier otro valor para tarifa regular.</param>
        /// <returns>El precio final del viaje en euros, con descuentos aplicados si corresponde.</returns>
        /// <exception cref="ArgumentException">Lanzada cuando el trayecto calculado no es válido (más de 3 zonas).</exception>
        /// <remarks>
        /// <para><strong>Reglas de Negocio - Descuentos:</strong></para>
        /// <list type="bullet">
        ///   <item><description><strong>JOVEN:</strong> 50% de descuento sobre la tarifa base.</description></item>
        ///   <item><description><strong>JUBILADO:</strong> 75% de descuento sobre la tarifa base (paga solo el 25%).</description></item>
        ///   <item><description><strong>Regular:</strong> Sin descuento, paga tarifa completa.</description></item>
        /// </list>
        /// <para><strong>Tarifas Base por Zonas Atravesadas:</strong></para>
        /// <list type="table">
        ///   <item><term>1 zona</term><description>€1.50</description></item>
        ///   <item><term>2 zonas</term><description>€1.80</description></item>
        ///   <item><term>3 zonas</term><description>€1.90</description></item>
        /// </list>
        /// <para>El cálculo de zonas atravesadas se realiza como: |zonaDestino - zonaOrigen| + 1</para>
        /// </remarks>
        /// <example>
        /// <code>
        /// var service = new TarifasService();
        /// 
        /// // Viaje regular de 2 zonas (zona 1 a zona 3)
        /// decimal precioRegular = service.CalcularPrecioViaje(1, 3, "REGULAR");
        /// // Resultado: €1.90
        /// 
        /// // Viaje con descuento joven
        /// decimal precioJoven = service.CalcularPrecioViaje(1, 3, "JOVEN");
        /// // Resultado: €0.95 (50% descuento)
        /// 
        /// // Viaje con descuento jubilado
        /// decimal precioJubilado = service.CalcularPrecioViaje(2, 2, "JUBILADO");
        /// // Resultado: €0.375 (75% descuento sobre €1.50)
        /// </code>
        /// </example>
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
