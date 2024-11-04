// src/App.tsx
import React, { useState } from "react";
import Nav from "./components/Nav/Nav";
import Sidebar from "./components/Sidebar/Sidebar";
import Content from "./components/Content/Content";

const App: React.FC = () => {
    const [selectedView, setSelectedView] = useState("Today");
    const [selectedFriend, setSelectedFriend] = useState<string | null>(null);
    const [userId, setUserId] = useState<number>(1);  // userId 설정 예제
    const [isLoggedIn, setIsLoggedIn] = useState(true); // 로그인 여부
    const [userName, setUserName] = useState("Denise"); // 사용자 닉네임

    return (
        <div className="flex flex-col h-screen">
            <Nav isLoggedIn={isLoggedIn} userName={userName} />

            <div className="flex flex-1">
                <Sidebar setSelectedView={setSelectedView} />
                <Content selectedView={selectedView} selectedFriend={selectedFriend} userId={userId} />
            </div>
        </div>
    );
};

export default App;
