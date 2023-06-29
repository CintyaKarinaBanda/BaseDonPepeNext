import React, { useState, useEffect } from "react";

const Operaciones = () => {
  const [transacionUno, setTransacionUno] = useState([]);
  const [providers, setProviders] = useState([]);

  const handleTransacionUno = async () => {
    try {
      const response = await fetch("/api/transacionUno");

      if (response.ok) {
        const data = await response.json();
        setTransacionUno(data.transacionUno);
      } else {
        console.error("Error al buscar transacion uno");
      }
    } catch (error) {
      console.error(`Error en la solicitud: ${error}`);
    }
  };
  const handleProviders = async () => {
    try {
      const response = await fetch("/api/transacionDos");

      if (response.ok) {
        const data = await response.json();
        setProviders(data.providers);
      } else {
        console.error("Error al buscar transacion dos");
      }
    } catch (error) {
      console.error(`Error en la solicitud: ${error}`);
    }
  };

  return (
    <div>
      <button onClick={handleTransacionUno}>Ejecutar transacion uno</button>
      <div>
        {transacionUno.length > 0 && (
          <table>
            <thead>
              <tr>
                <th>ID</th>
                <th>Nombre</th>
                <th>Descripción</th>
              </tr>
            </thead>
            <tbody>
              {transacionUno.map((product) => (
                <tr key={product.id_product}>
                  <td>{product.id_product}</td>
                  <td>{product.nom_product}</td>
                  <td>{product.desc_product}</td>
                </tr>
              ))}
            </tbody>
          </table>
        )}
      </div>
      <br />
      <button onClick={handleProviders}>Ejecutar transacion dos</button>
      <div>
        {providers.length > 0 && (
          <table>
            <thead>
              <tr>
                <th>ID</th>
                <th>Nombre</th>
              </tr>
            </thead>
            <tbody>
              {providers.map((provider) => (
                <tr key={provider.id_pro}>
                  <td>{provider.id_pro}</td>
                  <td>{provider.name_pro}</td>
                </tr>
              ))}
            </tbody>
          </table>
        )}
      </div>
    </div>
  );
};

export default Operaciones;
