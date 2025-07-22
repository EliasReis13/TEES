const url: string = "https://jsonplaceholder.typicode.com/comments";

export async function getComments() {
    try {
        const response = await fetch(url);
        if (!response.ok) {
            throw new Error("Não foi possível obter os comentários");
        }

        const commentsJson = await response.json();
        return commentsJson;
    } catch (error) {
        throw new Error("Erro ao obter os comentários");
    }
}
