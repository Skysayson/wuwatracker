import { ConveneStats } from "@/components/convenes/convene-stats";
import Header from "@/components/home/header";

export default function Home() {
  return (
    <div className="flex flex-col h-full p-7">
      <Header />
      <ConveneStats />
    </div>
  );
}
