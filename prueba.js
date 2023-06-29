import prisma from "../../prisma/client";

export default async function handler(req, res) {
  try {
    if (req.method === "GET") {
      await prisma.$transaction(async (transaction) => {
        await transaction.provider.update({
          where: { id_pro: 1 },
          data: { name_pro: "Juanitos" },
        });
        const providers = await transaction.provider.findMany();
        res.status(200).json({ providers });
      });
    } else {
      res.status(400).json({ error: "Método no permitido" });
    }
  } catch (error) {
    res.status(500).json(`Error en la transacción: ${error}`);
  }
}

import prisma from "../../prisma/client";

export default async function handler(req, res) {
    await prisma.$transaction(async (transaction) => {    
        if (req.method === "GET") {
            try {
                
                    await transaction.provider.update({
                      where: { id_pro: 1 },
                      data: { name_pro: "Juanitos" },
                    });
                    const providers = await transaction.provider.findMany();
                    res.status(200).json({ providers });
                
            }
            catch (error) {
                res.status(500).json(`Error al buscar transación uno 1: ${error}`);
                await transaction.$rollback();
            }
        } 
        else {
            res.status(400).json({ error: "Método no permitido" });
            await transaction.$rollback();
        }
    });
} 
