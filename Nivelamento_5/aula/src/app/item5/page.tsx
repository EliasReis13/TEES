"use client";

import { useEffect, useState } from "react";
import { getAlbums } from "@/service/albums"; 

export default function Item5() {
  const [albums, setAlbums] = useState([]);

  async function obterAlbuns() {
    const a = await getAlbums();
    setAlbums(a);
  }

  useEffect(() => {
    obterAlbuns();
  }, []);

  return (
    <div className="p-4 text-white">
      <h2 className="text-xl font-bold mb-4">Álbuns</h2>
      <ul>
        {albums.map((album: any) => (
          <li key={album.id} className="mb-2">
            <strong>ID:</strong> {album.id} <br />
            <strong>Título:</strong> {album.title} <br />
            <strong>Usuário:</strong> {album.userId}
            <hr className="my-2 border-gray-600" />
          </li>
        ))}
      </ul>
    </div>
  );
}
