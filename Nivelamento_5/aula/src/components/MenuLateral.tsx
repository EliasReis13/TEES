import Link from "next/link";
import MenuItem from "./MenuItem";

export default function MenuLateral(){
    return (
        <div className="bg-sky-400 p-4 h-full w-[200px]">
            <Link href="\item1">
                <MenuItem item = "Usuários" />
            </Link>

             <Link href="\item2">
                <MenuItem item = "Posts" />
            </Link>

            <Link href="\item3">
                <MenuItem item = "Comentários" />
            </Link>

            <Link href="\item4">
                <MenuItem item = "Tarefas" />
            </Link>

            <Link href="\item5">
                <MenuItem item = "Álbuns" />
            </Link>
        </div>

    )
}