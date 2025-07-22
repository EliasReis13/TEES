const url: string = "https://jsonplaceholder.typicode.com/albums";

export async function getAlbums() {
    try {
        const response = await fetch(url);
        if (!response.ok) {
            throw new Error("Não foi possível obter os álbuns");
        }

        const albumsJson = await response.json();
        return albumsJson;
    } catch (error) {
        throw new Error("Erro ao obter os álbuns");
    }
}
