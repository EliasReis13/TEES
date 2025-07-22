const url: string = "https://jsonplaceholder.typicode.com/todos";

export async function getTodos() {
    try {
        const response = await fetch(url);
        if (!response.ok) {  
            throw new Error("Não foi possível obter as tarefas");
        }

        const usuariosJson = await response.json();
        
        return usuariosJson;
    } catch (error) {  
        throw new Error("Erro ao obter as tarefas");
    }
}