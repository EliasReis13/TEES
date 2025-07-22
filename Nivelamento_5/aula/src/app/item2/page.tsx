"use client"

import { useEffect, useState} from "react";
import { getPosts} from "@/service/posts";

export default function Item2(){
    const [posts, setPosts] = useState([]);

    async function obterPosts() {
        const p = await getPosts();
        setPosts(p);
    }

    useEffect(() => {
        obterPosts();
    }, []);

    return (
        <div className="p-4 text-white">
            <h2 className="text-xl font-bold mb-4">Posts</h2>
            <ul>
                {posts.map((post: any) => (
                    <li key={post.id} className="mb-4">
                        <p><strong>Título:</strong> {post.title}</p>
                        <p><strong>Corpo:</strong> {post.body}</p>
                        <hr className="my-2 border-gray-600" />
                    </li>
                ))}
            </ul>
        </div>
    );
} 