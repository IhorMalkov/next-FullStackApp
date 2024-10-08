import Card from "./Card";
import SideBarLink from "./SideBarLink";

const links = [
    { label: "Home", icon: "Grid", link: "/home" },
    {
        label: "Calendar",
        icon: "Calendar",
        link: "/calendar",
    },
    { label: "Profile", icon: "User", link: "/profile" },
    {
        label: "Settings",
        icon: "Settings",
        link: "/settings",
    },
];

const Sidebar = () => {
    return (
        <Card className="h-full w-40 flex items-center justify-between flex-wrap">
            <div className="w-full flex justify-center items-center">
            </div>
            {links.map((link) => (
                <SideBarLink link={link} />
            ))}
        </Card>
    );
};

export default Sidebar;