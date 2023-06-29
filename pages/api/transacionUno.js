import prisma from "../../prisma/client";

export default async function handler(req, res) {
    if (req.method === "GET") {
        try {
            await prisma.$transaction(async (transaction) => {
                const transacionUno = await transaction.product.findMany();
                res.status(200).json({ transacionUno });
            });
            await transaction.$commit();
        } 
        catch (error) {
            res.status(500).json(`Error al buscar transación uno 1 (transacionesUno.js): ${error}`);
            await transaction.$rollback();
        }
    } else {
        res.status(400).json({ error: "Método no permitido" });
        await transaction.$rollback();
    }
}
