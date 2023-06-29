import prisma from "../../prisma/client";

export default async function handler(req, res) {
    if (req.method === "GET") {
        try {
            await prisma.$transaction(async (transaction) => {
                await transaction.provider.update({
                    where: { id_pro: 1 },
                    data: { name_pro: "Juanitos" },
                });
                const providers = await transaction.provider.findMany();
                res.status(200).json({ providers });
            });
            await transaction.$commit();
        } catch (error) {
            res.status(500).json(`Error al buscar transacción dos (transacionesDos.js): ${error}`);
        }
    } else {
        res.status(400).json({ error: "Método no permitido" });
    }
}



