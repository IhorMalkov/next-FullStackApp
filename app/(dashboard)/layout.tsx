import {ReactNode} from "react";
import GlassPane from "@/components/GlassPane";
import "@/styles/global.css";
import Sidebar from "../../components/Sidebar";

export default function AuthRootLayout({children}: {children: ReactNode}) {
    return (
        <html lang="en">
        <head/>
        <body className="h-screen w-screen h-screen candy-mesh p-6">
        <GlassPane className="w-full h-full flex items-center">
            <Sidebar/>
            {children}
        </GlassPane>
        <div id="modal"></div>
        </body>
        </html>
    )
}