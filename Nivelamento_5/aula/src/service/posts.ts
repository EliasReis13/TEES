const url: string = "https://jsonplaceholder.typicode.com/users";

export async function getPosts(){
    try {
        const response = await fetch(url);
        if (!response.ok) {  
            throw new Error("Não foi possível obter os posts");
        }

        const postsJson = await response.json();
        
        return postsJson;
    }catch (error) {
        throw new Error("Erro ao obter os posts");
    }
}