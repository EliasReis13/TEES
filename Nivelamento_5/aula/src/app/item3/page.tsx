"use client"

import { useEffect, useState } from "react";
import { getComments } from "@/service/comments";

export default function Item3() {
  const [comments, setComments] = useState([]);

  async function obterComentarios() {
    const c = await getComments();
    setComments(c);
  }

  useEffect(() => {
    obterComentarios();
  }, []);

  return (
    <div className="p-4 text-white">
      <h2 className="text-xl font-bold mb-4">Comentários</h2>
      <ul>
        {comments.map((comment: any) => (
          <li key={comment.id} className="mb-4">
            <p><strong>Nome:</strong> {comment.name}</p>
            <p><strong>Email:</strong> {comment.email}</p>
            <p><strong>Comentário:</strong> {comment.body}</p>
            <hr className="my-2 border-gray-600" />
          </li>
        ))}
      </ul>
    </div>
  );
}