import { type NextPage } from "next";
import { signIn, signOut, useSession } from "next-auth/react";

import { api } from "../utils/api";

const Home: NextPage = () => {
  const hello = api.example.hello.useQuery({ text: "Testing!" });

  return (
    <main>
      <p className="text-2xl text-white">
        {hello.data ? hello.data.greeting : "Loading tRPC query..."}
      </p>
      <AuthShowcase />
    </main>
  );
};

export default Home;

const AuthShowcase: React.FC = () => {
  const { data: sessionData } = useSession();

  const secretMessage = api.example.getSecretMessage.useQuery(undefined, {
    enabled: sessionData?.user !== undefined,
  });

  return (
    <div>
      <p>
        {sessionData && <span>Logged in as {sessionData.user?.name}!</span>}
        {secretMessage.data && <span> - {secretMessage.data}</span>}
      </p>
      <button
        onClick={sessionData ? () => void signOut() : () => void signIn()}
      >
        {sessionData ? "Sign out" : "Sign in"}
      </button>
    </div>
  );
};
