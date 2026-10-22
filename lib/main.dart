import React, { useState, useEffect } from 'react';
import { 
  Compass, 
  BookOpen, 
  Clock, 
  Heart, 
  Volume2, 
  Settings, 
  Moon, 
  Sun, 
  ChevronLeft, 
  RotateCcw,
  Sparkles,
  Bookmark
} from 'lucide-react';

const AdhkarButton = ({ category, isActive, onClick }) => (
  <button
    onClick={onClick}
    className={`px-4 py-2 rounded-xl text-xs font-bold transition-all whitespace-nowrap ${
      isActive
        ? 'bg-amber-500 text-slate-950 shadow-lg shadow-amber-500/20'
        : 'bg-zinc-900 text-amber-300/70 border border-amber-500/20 hover:bg-amber-500/10'
    }`}
  >
    أذكار {category}
  </button>
);

export default function AtharApp() {
  const [activeTab, setActiveTab] = useState<'home' | 'quran' | 'adhkar' | 'tasbih'>('home');
  const [tasbihCount, setTasbihCount] = useState(0);
  const [tasbihTarget, setTasbihTarget] = useState(33);
  const [currentAdhkarCategory, setCurrentAdhkarCategory] = useState('الصباح');
  
  // وقت الأنفاق والصلاة التجريبي
  const prayerTimes = [
    { name: 'الفجر', time: '04:45 ص', active: false },
    { name: 'الشروق', time: '06:15 ص', active: false },
    { name: 'الظهر', time: '12:05 م', active: true },
    { name: 'العصر', time: '03:30 م', active: false },
    { name: 'المغرب', time: '06:00 م', active: false },
    { name: 'العشاء', time: '07:20 م', active: false },
  ];

  return (
    <div className="min-h-screen bg-[#09090b] text-amber-50 font-['Cairo',sans-serif] flex flex-col max-w-md mx-auto shadow-2xl border-x border-amber-500/20 relative overflow-hidden">
      
      {/* خلفية جمالية إسلامية خافتة */}
      <div className="absolute top-0 right-0 w-96 h-96 bg-amber-500/5 rounded-full blur-3xl pointer-events-none"></div>
      <div className="absolute bottom-0 left-0 w-96 h-96 bg-amber-600/5 rounded-full blur-3xl pointer-events-none"></div>

      {/* الهيدر العلوي */}
      <header className="p-5 flex justify-between items-center border-b border-amber-500/20 bg-[#09090b]/80 backdrop-blur-md sticky top-0 z-50">
        <div className="flex items-center gap-3">
          <div className="w-10 h-10 rounded-xl bg-gradient-to-br from-amber-400 to-amber-600 flex items-center justify-center shadow-lg shadow-amber-500/20">
            <Sparkles className="w-5 h-5 text-slate-950" />
          </div>
          <div>
            <h1 className="font-bold text-lg text-amber-400 tracking-wide">أَثَر | ATHAR</h1>
            <p className="text-xs text-amber-200/60">التطبيق الإسلامي الفاخر</p>
          </div>
        </div>
        <button className="p-2 rounded-xl bg-amber-500/10 border border-amber-500/20 text-amber-400 hover:bg-amber-500/20 transition-all">
          <Settings className="w-5 h-5" />
        </button>
      </header>

      {/* المحتوى الرئيسي حسب التبويب */}
      <main className="flex-1 overflow-y-auto p-5 pb-24">
        
        {/* تبويب الرئيسية */}
        {activeTab === 'home' && (
          <div className="space-y-6">
            {/* بطاقة التاريخ الهجري والصلاة القادمة */}
            <div className="relative rounded-2xl p-6 bg-gradient-to-br from-amber-500/10 via-amber-500/5 to-transparent border border-amber-500/30 overflow-hidden shadow-xl">
              <div className="absolute top-0 left-0 w-full h-1 bg-gradient-to-r from-amber-500 via-amber-300 to-amber-600"></div>
              <div className="flex justify-between items-start mb-4">
                <div>
                  <span className="text-xs px-3 py-1 rounded-full bg-amber-500/20 text-amber-300 border border-amber-500/30 font-medium">
                    15 رمضان 1447 هـ
                  </span>
                  <h2 className="text-2xl font-extrabold mt-3 text-amber-100">الصلاة القادمة: الظهر</h2>
                </div>
                <div className="text-left">
                  <span className="text-xs text-amber-400/80">متبقي على الأذان</span>
                  <p className="text-xl font-bold text-amber-300 font-mono">01:24:10</p>
                </div>
              </div>
              <div className="flex items-center gap-2 text-xs text-amber-200/70 pt-2 border-t border-amber-500/10">
                <Compass className="w-4 h-4 text-amber-400" />
                <span>اتجاه القبلة: 135° جنوب شرق الغردقة</span>
              </div>
            </div>

            {/* مواقيت الصلاة مصغرة */}
            <div>
              <h3 className="text-sm font-bold text-amber-300 mb-3 flex items-center gap-2">
                <Clock className="w-4 h-4" /> مواقيت الصلاة اليوم
              </h3>
              <div className="grid grid-cols-2 gap-3">
                {prayerTimes.map((p, idx) => (
                  <div 
                    key={idx}
                    className={`p-3 rounded-xl border flex justify-between items-center transition-all ${
                      p.active 
                        ? 'bg-amber-500/20 border-amber-500/50 shadow-lg shadow-amber-500/10' 
                        : 'bg-zinc-900/50 border-zinc-800 hover:border-amber-500/30'
                    }`}
                  >
                    <span className={`font-medium ${p.active ? 'text-amber-300 font-bold' : 'text-zinc-300'}`}>{p.name}</span>
                    <span className={`font-mono text-sm ${p.active ? 'text-amber-400 font-bold' : 'text-zinc-400'}`}>{p.time}</span>
                  </div>
                ))}
              </div>
            </div>

            {/* آية اليوم */}
            <div className="p-5 rounded-2xl bg-zinc-900/80 border border-amber-500/20 relative">
              <div className="absolute top-3 left-3 text-amber-500/20 font-serif text-4xl">“</div>
              <h3 className="text-xs font-bold text-amber-400 mb-2 uppercase tracking-wider">آية الإشراق</h3>
              <p className="text-amber-100 font-serif text-lg leading-relaxed mb-3 text-center">
                {`"وَاصْبِرْ لِحُكْمِ رَبِّكَ فَإِنَّكَ بِأَعْيُنِنَا وَسَبِّحْ بِحَمْدِ رَبِّكَ حِينَ تَقُومُ"`}
              </p>
              <p className="text-xs text-center text-amber-400/60 font-medium">سورة الطور - الآية 48</p>
            </div>
          </div>
        )}

        {/* تبويب القرآن الكريم */}
        {activeTab === 'quran' && (
          <div className="space-y-4">
            <h2 className="text-xl font-bold text-amber-400 mb-4 flex items-center gap-2">
              <BookOpen className="w-5 h-5" /> القرآن الكريم
            </h2>
            {['سورة الفاتحة', 'سورة البقرة', 'سورة آل عمران', 'سورة الكهف', 'سورة الملك'].map((surah, idx) => (
              <div key={idx} className="p-4 rounded-xl bg-zinc-900/60 border border-amber-500/20 flex justify-between items-center hover:bg-amber-500/10 transition-all cursor-pointer">
                <div className="flex items-center gap-4">
                  <div className="w-8 h-8 rounded-lg bg-amber-500/10 border border-amber-500/30 flex items-center justify-center text-amber-400 font-bold text-sm">
                    {idx + 1}
                  </div>
                  <div>
                    <h4 className="font-bold text-amber-100">{surah}</h4>
                    <p className="text-xs text-amber-300/60">مكية / مدنية • آياتها عديدة</p>
                  </div>
                </div>
                <ChevronLeft className="w-5 h-5 text-amber-400/60" />
              </div>
            ))}
          </div>
        )}

        {/* تبويب الأذكار */}
        {activeTab === 'adhkar' && (
          <div className="space-y-4">
             حصن المسلم والأذكار 
            <div className="flex gap-2 overflow-x-auto pb-2">
              {['الصباح', 'المساء', 'الصلاة', 'النوم', 'الاستغفار'].map((cat) => (
                <AdhkarButton
                  key={cat}
                  category={cat}
                  isActive={currentAdhkarCategory === cat}
                  onClick={() => setCurrentAdhkarCategory(cat)}
                />
              ))}
            </div>

            <div className="p-5 rounded-2xl bg-zinc-900/60 border border-amber-500/20 space-y-3">
              <span className="text-xs px-2.5 py-1 rounded-md bg-amber-500/20 text-amber-300 font-semibold">التكرار: 3 مرات</span>
              <p className="text-amber-100 text-base leading-relaxed font-serif">
                {`"رضيت بالله رباً، وبالإسلام ديناً، وبمحمد صلى الله عليه وسلم نبياً ورسولاً."`}
              </p>
              <div className="pt-3 border-t border-amber-500/10 flex justify-between items-center text-xs text-amber-400/70">
                <span>فضلها عظيماً</span>
                <button className="px-3 py-1.5 rounded-lg bg-amber-500/20 text-amber-300 font-bold hover:bg-amber-500/30 transition-all">
                  تم القراءة (3/3)
                </button>
              </div>
            </div>
          </div>
        )}

        {/* تبويب المسبحة الإلكترونية */}
        {activeTab === 'tasbih' && (
          <div className="flex flex-col items-center justify-center py-6 space-y-8">
            <div className="text-center">
              <h2 className="text-xl font-bold text-amber-400 mb-1">السبحة الإلكترونية</h2>
              <p className="text-xs text-amber-200/60">أعذب الأذكار وأطهرها لقلبك</p>
            </div>

            {/* حلقة السبحة الكبرى */}
            <div 
              onClick={() => setTasbihCount(prev => prev + 1)}
              className="w-56 h-56 rounded-full bg-gradient-to-br from-amber-500/20 via-zinc-900 to-amber-600/10 border-2 border-amber-500/40 flex flex-col items-center justify-center cursor-pointer shadow-2xl shadow-amber-500/20 active:scale-95 transition-all relative group"
            >
              <div className="absolute inset-2 rounded-full border border-amber-500/20 pointer-events-none group-hover:scale-105 transition-all"></div>
              <span className="text-xs text-amber-400/80 mb-1 font-medium">سُبْحَانَ اللَّهِ</span>
              <span className="text-6xl font-black text-amber-300 font-mono tracking-wider">{tasbihCount}</span>
              <span className="text-[10px] text-amber-200/50 mt-2">اضغط للتسبيح</span>
            </div>

            <div className="flex gap-4 w-full px-4">
              <button 
                onClick={() => setTasbihCount(0)}
                className="flex-1 py-3 rounded-xl bg-zinc-900 border border-amber-500/20 text-amber-400 font-bold text-sm flex items-center justify-center gap-2 hover:bg-amber-500/10 transition-all"
              >
                <RotateCcw className="w-4 h-4" /> إعادة العداد
              </button>
            </div>
          </div>
        )}

      </main>

      {/* شريط التنقل السفلي */}
      <nav className="absolute bottom-0 left-0 w-full bg-[#09090b]/95 backdrop-blur-lg border-t border-amber-500/20 px-4 py-2 flex justify-around items-center z-50">
        {[
          { id: 'home', label: 'الرئيسية', icon: Sparkles },
          { id: 'quran', label: 'القرآن', icon: BookOpen },
          { id: 'adhkar', label: 'الأذكار', icon: Heart },
          { id: 'tasbih', label: 'المسبحة', icon: Compass },
        ].map((tab) => {
          const Icon = tab.icon;
          const isActive = activeTab === tab.id;
          return (
            <button
              key={tab.id}
              onClick={() => setActiveTab(tab.id)}
              className={`flex flex-col items-center py-2 px-3 rounded-xl transition-all ${
                isActive 
                  ? 'text-amber-400 scale-105' 
                  : 'text-zinc-500 hover:text-amber-300/70'
              }`}
            >
              <Icon className={`w-5 h-5 mb-1 ${isActive ? 'text-amber-400 animate-pulse' : ''}`} />
              <span className="text-[10px] font-bold">{tab.label}</span>
            </button>
          );
        })}
      </nav>

    </div>
  );
}