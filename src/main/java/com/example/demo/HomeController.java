package com.example.demo;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.MalformedURLException;
import java.net.URL;
import java.net.URLConnection;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Set;
import java.util.Timer;

import javax.servlet.http.HttpServletRequest;

import org.snu.ids.ha.index.Keyword;
import org.snu.ids.ha.index.KeywordExtractor;
import org.snu.ids.ha.index.KeywordList;
import org.snu.ids.ha.ma.MExpression;
import org.snu.ids.ha.ma.MorphemeAnalyzer;
import org.snu.ids.ha.ma.Sentence;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.example.demo.dao.InvestDao;
import com.example.demo.dao.TextDao;
import com.example.demo.dto.MeetingservDto;
import com.example.demo.dto.chartDto;
import com.example.demo.dto.investDto;
import com.example.demo.dto.keywordDTO;
import com.example.demo.dto.pieDto;
import com.google.cloud.translate.Translate;
import com.google.cloud.translate.Translate.TranslateOption;
import com.google.cloud.translate.TranslateOptions;
import com.google.cloud.translate.Translation;
import com.ibm.watson.developer_cloud.natural_language_understanding.v1.NaturalLanguageUnderstanding;
import com.ibm.watson.developer_cloud.natural_language_understanding.v1.model.AnalysisResults;
import com.ibm.watson.developer_cloud.natural_language_understanding.v1.model.AnalyzeOptions;
import com.ibm.watson.developer_cloud.natural_language_understanding.v1.model.CategoriesOptions;
import com.ibm.watson.developer_cloud.natural_language_understanding.v1.model.ConceptsOptions;
import com.ibm.watson.developer_cloud.natural_language_understanding.v1.model.Features;
import com.ibm.watson.developer_cloud.natural_language_understanding.v1.model.KeywordsOptions;
import com.ibm.watson.developer_cloud.natural_language_understanding.v1.model.SentimentOptions;

import kr.bydelta.koala.eunjeon.Tagger;
import kr.bydelta.koala.twt.SentenceSplitter;

@RestController
public class HomeController {

	
	@Autowired
	private TextDao mapper;
	@Autowired
	private InvestDao mapper1;
	
	
	
	@RequestMapping("/textinsert/{id}/{text}/{part}")
	public void textinsert(@PathVariable String id,@PathVariable String text,@PathVariable String part) {
		
		mapper.inserttextSTT(id,text);
		textsplit(id,part);
		return ;
	}
	
	public void textsplit(String id,String part) {
		// string to extract keywords
		//String strToExtrtKwrd = "기업이 운영했던 기존의 관리 방식에서 탈피하여 디지털 기술을 가미한 운영 방식으로 바뀌게 되는 것을 '디지털 트랜스포메이션(Digital Transformation)'이라고 합니다. 디지털 트랜스포메이션은 기업규모와 관계없이 모든 비즈니스에서 반드시 필요합니다. 물류, IT, 금융, 의료서비스 등 다양한 산업군에서 디지털 트랜스포메이션을 요구할 수 있습니다. 고객과 직원에게 우수한 디지털 비즈니스 경험을 제공하려면 혁신적인 비즈니스 프로세스를 사용해야 합니다. 기업은 엄청난 속도로 진화하는 오늘날의 비즈니스 환경에 걸맞는 디지털 트랜스포메이션 솔루션을 제공할 수 있어야 합니다. 이것이 오늘날 세계적인 기업간의 경쟁에서 앞서 나가는 방법이 될 수 있습니다. 이를 위해서 운영 비용을 낮추고 고객 경험을 향상시키는 것이 핵심입니다. 디지털 전환은 단순히 최신기술을 수용하는 것이 아닌, 생각하는 방식과 조직 문화의 변화에 초점을 맞춥니다. 조직에서는 비즈니스의 변화, 비즈니스 요구 사항 등을 해결하고 이를 신속하게 대응할 수 있는 방법을 마련해야 합니다. 리더는 비즈니스 요구 사항을 충족시키고 혁신을 주도하며 지속적으로 비즈니스 환경을 개선해 나가야 합니다. 이것이 디지털 트랜스포메이션의 핵심입니다. 즉, 비즈니스 활동을 가속화시키고 비용을 낮추며, 제품 출시 시간을 단축하는 등 비즈니스 프로세스와 조직원의 역량과 마인드를 긍정적으로 변화시킬 수 있습니다. '디지털 트랜스포메이션'은 '비즈니스 트랜스포메이션'이라고도 불려집니다. '비즈니스 트랜스포메이션'은 혁신적인 기술, 소비자 고객 행동 및 시장 요구, 환경 요인 등의 요소에 의해 주도됩니다. 기술 혁신은 혼란을 가져올 수 있습니다. 기존 비즈니스 프로세스가 빅데이터, 클라우드, 인공지능 등의 최신 기술을 적용시키기 위해 기존 시스템에서 벗어나려하기 때문입니다. 점차 비즈니스에 새로운 가치가 부여되고 속도가 점점 빨라지면서 노력과 비용이 절감되는 등 좋은 결과가 나타나기 시작합니다. 비즈니스에 대해 고객이 기대하는 것과 요구사항이 무엇인지 파악하는 것도 중요합니다. 고객은 항상 사용하기 편리한 기술을 요구합니다. 이러한 이유로 고객의 요구 사항 및 기술의 발전이 비즈니스 요구 사항을 충족시킬 수 있는지에 대한 여부가 중요합니다. 기업의 성공적인 디지털 전환을 위해서는 아래와 같이 디지털 기술의 성숙도와 조직 문화가 중요합니다. 1. 고객 요구 사항 : 고객에게 모든 측면에서 유쾌한 경험을 제공하라. 이는 결과적으로 고객의 브랜드 충성도를 높임 2. 프로세스 오리엔테이션 (Process Orientation) : 데이터 중심의 의사 결정을 촉진해 성능 향상 및 운영 투명성을 향상시키는 디지털화 방법 3. 혁신적 비즈니스 : 기존의 비즈니스 요구사항을 뛰어 넘는 새로운 디지털 제품 및 디지털화 된 비즈니스 모델을 통해 변화하는 비즈니스 요구에 부응 디지털 전환은 비즈니스 세계에 변혁을 일으키는 폭풍과 같은 것 입니다. 이는 조직운영 뿐 아니라 산업 구조 전반에 걸쳐 영향을 미칩니다. 디지털 혁신이 비즈니스를 주도하고 생산의 변화를 가져오며 가치를 창출할 수 있도록 비즈니스 리더가 앞장서야 합니다.";
		String result=mapper.textshow(id);
		List<String> stopwords = Arrays.asList("은","되","보","수","있","!","\"","$","%","&","'","(",")","*","+",",","-",".","...","0","1","2","3","4","5","6","7","8","9",";","<","=",">","?","@","\\","^","_","`","|","~","·","—","——","‘","’","“","”","…","、","。","〈","〉","《","》","가","가까스로","가령","각","각각","각자","각종","갖고말하자면","같다","같이","개의치않고","거니와","거바","거의","것","것과 같이","것들","게다가","게우다","겨우","견지에서","결과에 이르다","결국","결론을 낼 수 있다","겸사겸사","고려하면","고로","곧","공동으로","과","과연","관계가 있다","관계없이","관련이 있다","관하여","관한","관해서는","구","구체적으로","구토하다","그","그들","그때","그래","그래도","그래서","그러나","그러니","그러니까","그러면","그러므로","그러한즉","그런 까닭에","그런데","그런즉","그럼","그럼에도 불구하고","그렇게 함으로써","그렇지","그렇지 않다면","그렇지 않으면","그렇지만","그렇지않으면","그리고","그리하여","그만이다","그에 따르는","그위에","그저","그중에서","그치지 않다","근거로","근거하여","기대여","기점으로","기준으로","기타","까닭으로","까악","까지","까지 미치다","까지도","꽈당","끙끙","끼익","나","나머지는","남들","남짓","너","너희","너희들","네","넷","년","논하지 않다","놀라다","누가 알겠는가","누구","다른","다른 방면으로","다만","다섯","다소","다수","다시 말하자면","다시말하면","다음","다음에","다음으로","단지","답다","당신","당장","대로 하다","대하면","대하여","대해 말하자면","대해서","댕그","더구나","더군다나","더라도","더불어","더욱더","더욱이는","도달하다","도착하다","동시에","동안","된바에야","된이상","두번째로","둘","둥둥","뒤따라","뒤이어","든간에","들","등","등등","딩동","따라","따라서","따위","따지지 않다","딱","때","때가 되어","때문에","또","또한","뚝뚝","라 해도","령","로","로 인하여","로부터","로써","륙","를","마음대로","마저","마저도","마치","막론하고","만 못하다","만약","만약에","만은 아니다","만이 아니다","만일","만큼","말하자면","말할것도 없고","매","매번","메쓰겁다","몇","모","모두","무렵","무릎쓰고","무슨","무엇","무엇때문에","물론","및","바꾸어말하면","바꾸어말하자면","바꾸어서 말하면","바꾸어서 한다면","바꿔 말하면","바로","바와같이","밖에 안된다","반대로","반대로 말하자면","반드시","버금","보는데서","보다더","보드득","본대로","봐","봐라","부류의 사람들","부터","불구하고","불문하고","붕붕","비걱거리다","비교적","비길수 없다","비로소","비록","비슷하다","비추어 보아","비하면","뿐만 아니라","뿐만아니라","뿐이다","삐걱","삐걱거리다","사","삼","상대적으로 말하자면","생각한대로","설령","설마","설사","셋","소생","소인","솨","쉿","습니까","습니다","시각","시간","시작하여","시초에","시키다","실로","심지어","아","아니","아니나다를가","아니라면","아니면","아니었다면","아래윗","아무거나","아무도","아야","아울러","아이","아이고","아이구","아이야","아이쿠","아하","아홉","안 그러면","않기 위하여","않기 위해서","알 수 있다","알았어","앗","앞에서","앞의것","야","약간","양자","어","어기여차","어느","어느 년도","어느것","어느곳","어느때","어느쪽","어느해","어디","어때","어떠한","어떤","어떤것","어떤것들","어떻게","어떻해","어이","어째서","어쨋든","어쩔수 없다","어찌","어찌됏든","어찌됏어","어찌하든지","어찌하여","언제","언젠가","얼마","얼마 안 되는 것","얼마간","얼마나","얼마든지","얼마만큼","얼마큼","엉엉","에","에 가서","에 달려 있다","에 대해","에 있다","에 한하다","에게","에서","여","여기","여덟","여러분","여보시오","여부","여섯","여전히","여차","연관되다","연이서","영","영차","옆사람","예","예를 들면","예를 들자면","예컨대","예하면","오","오로지","오르다","오자마자","오직","오호","오히려","와","와 같은 사람들","와르르","와아","왜","왜냐하면","외에도","요만큼","요만한 것","요만한걸","요컨대","우르르","우리","우리들","우선","우에 종합한것과같이","운운","월","위에서 서술한바와같이","위하여","위해서","윙윙","육","으로","으로 인하여","으로서","으로써","을","응","응당","의","의거하여","의지하여","의해","의해되다","의해서","이","이 되다","이 때문에","이 밖에","이 외에","이 정도의","이것","이곳","이때","이라면","이래","이러이러하다","이러한","이런","이럴정도로","이렇게 많은 것","이렇게되면","이렇게말하자면","이렇구나","이로 인하여","이르기까지","이리하여","이만큼","이번","이봐","이상","이어서","이었다","이와 같다","이와 같은","이와 반대로","이와같다면","이외에도","이용하여","이유만으로","이젠","이지만","이쪽","이천구","이천육","이천칠","이천팔","인 듯하다","인젠","일","일것이다","일곱","일단","일때","일반적으로","일지라도","임에 틀림없다","입각하여","입장에서","잇따라","있다","자","자기","자기집","자마자","자신","잠깐","잠시","저","저것","저것만큼","저기","저쪽","저희","전부","전자","전후","점에서 보아","정도에 이르다","제","제각기","제외하고","조금","조차","조차도","졸졸","좀","좋아","좍좍","주룩주룩","주저하지 않고","줄은 몰랏다","줄은모른다","중에서","중의하나","즈음하여","즉","즉시","지든지","지만","지말고","진짜로","쪽으로","차라리","참","참나","첫번째로","쳇","총적으로","총적으로 말하면","총적으로 보면","칠","콸콸","쾅쾅","쿵","타다","타인","탕탕","토하다","통하여","툭","퉤","틈타","팍","팔","퍽","펄렁","하","하게될것이다","하게하다","하겠는가","하고 있다","하고있었다","하곤하였다","하구나","하기 때문에","하기 위하여","하기는한데","하기만 하면","하기보다는","하기에","하나","하느니","하는 김에","하는 편이 낫다","하는것도","하는것만 못하다","하는것이 낫다","하는바","하더라도","하도다","하도록시키다","하도록하다","하든지","하려고하다","하마터면","하면 할수록","하면된다","하면서","하물며","하여금","하여야","하자마자","하지 않는다면","하지 않도록","하지마","하지마라","하지만","하하","한 까닭에","한 이유는","한 후","한다면","한다면 몰라도","한데","한마디","한적이있다","한켠으로는","한항목","할 따름이다","할 생각이다","할 줄 안다","할 지경이다","할 힘이 있다","할때","할만하다","할망정","할뿐","할수있다","할수있어","할줄알다","할지라도","할지언정","함께","해도된다","해도좋다","해봐요","해서는 안된다","해야한다","해요","했어요","향하다","향하여","향해서","허","허걱","허허","헉","헉헉","헐떡헐떡","형식으로 쓰여","혹시","혹은","혼자","훨씬","휘익","휴","흐흐","흥","힘입어","︿","！","＃","＄","％","＆","（","）","＊","＋","，","０","１","２","３","４","５","６","７","８","９","：","；","＜","＞","？","＠","［","］","｛","｜","｝","～","￥");
		//System.out.println(mapper.a()); ;
		// init KeywordExtractor
		KeywordExtractor ke = new KeywordExtractor();
		ArrayList<chartDto> cd= new ArrayList<chartDto>();
		// extract keywords
		KeywordList kl = ke.extractKeyword(result, true);
if(part.equals("Communication")) {
	part="통신";
}else if(part.equals("Distribution")) {
	part="물류";
}else if(part.equals("Manufactoring")) {
	part="제조";
}else {
	part="VDI";
}
		// print result
		for( int i = 0; i < kl.size(); i++ ) {
			Keyword kwrd = kl.get(i);
			chartDto cdtemp = new chartDto();
			for(int j=0;j<stopwords.size();j++) {
				if(!kwrd.getString().equals(stopwords.get(j))) {
					mapper.insertText(part,id,kwrd.getString(), kwrd.getCnt());
					break;
				}
						
			}
			
			//System.out.println(kwrd.getString() + "\t" + kwrd.getCnt());
		}
		
	}
	@RequestMapping("/detailpietextword")
	public List detailtextword(HttpServletRequest request) {
		
		List<keywordDTO> pie=mapper.pieshow(request.getParameter("part"));
		List<pieDto> pielist = new ArrayList<pieDto>();
		
		for(int i=0;i<6;i++) {
			pieDto pd=new pieDto();
			pd.setLabel(pie.get(i).getKeyword());
			
			pd.setValue(pie.get(i).getKeywordnum());
			pielist.add(pd);
			
		}
		
		return pielist;
	}
	@RequestMapping("/alldetailpietextword")
	public List alldetailpietextword(HttpServletRequest request) {
		List<keywordDTO> pie=mapper.allpieshow(request.getParameter("part"));
		
		return pie;
	}
	@RequestMapping("/showpaper")
	public String showpaper(HttpServletRequest request) {
		String text=mapper.textshow(request.getParameter("part"));
		System.out.println(text);
		
		return text;
	}
	
	@RequestMapping("/teammeeting")
	public List teammeeting() {
		return mapper.ALLmeeting_serv();
	}
	@RequestMapping("/teammonth")
	public List teammonth(HttpServletRequest request) {
		List<Integer> a;
		
		a=mapper.meetingmonth(request.getParameter("start"),request.getParameter("end"));
		
		
		
		return a;
	}
	@RequestMapping("/keywordshow")
	public List keywordshow(HttpServletRequest request) {
		return mapper.showkeyword(request.getParameter("part"));
	}
	@RequestMapping("/monthpart2show")
	public List monthpart2show(HttpServletRequest request) {
		List<String> pie=mapper.monthpieshow(request.getParameter("start"),request.getParameter("end"),request.getParameter("part"));
		List<Integer> pie1=mapper.monthpieshow1(request.getParameter("start"),request.getParameter("end"),request.getParameter("part"));
		List<pieDto> pielist = new ArrayList<pieDto>();
		
		for(int i=0;i<6;i++) {
			pieDto pd=new pieDto();
			pd.setLabel(pie.get(i));
			
			pd.setValue(pie1.get(i));
			pielist.add(pd);
			
		}
		
		return pielist;
	}
	@RequestMapping("/monthpart3show")
	public List monthpart3show(HttpServletRequest request) {
		List<String> pie=mapper.monthpieshow(request.getParameter("start"),request.getParameter("end"),request.getParameter("part"));
		List<Integer> pie1=mapper.monthpieshow1(request.getParameter("start"),request.getParameter("end"),request.getParameter("part"));
		List<pieDto> pielist = new ArrayList<pieDto>();
		
		for(int i=0;i<6;i++) {
			pieDto pd=new pieDto();
			pd.setLabel(pie.get(i));
			
			pd.setValue(pie1.get(i));
			pielist.add(pd);
			
		}
		
		return pielist;
	}
	@RequestMapping("/monthpart4show")
	public List monthpart4show(HttpServletRequest request) {
		List<String> pie=mapper.monthpieshow(request.getParameter("start"),request.getParameter("end"),request.getParameter("part"));
		List<Integer> pie1=mapper.monthpieshow1(request.getParameter("start"),request.getParameter("end"),request.getParameter("part"));
		List<pieDto> pielist = new ArrayList<pieDto>();
		
		for(int i=0;i<6;i++) {
			pieDto pd=new pieDto();
			pd.setLabel(pie.get(i));
			
			pd.setValue(pie1.get(i));
			pielist.add(pd);
			
		}
		
		return pielist;
	}
	@RequestMapping("/monthpart1show")
	public List monthpart1show(HttpServletRequest request) {
		List<String> pie=mapper.monthpieshow(request.getParameter("start"),request.getParameter("end"),request.getParameter("part"));
		List<Integer> pie1=mapper.monthpieshow1(request.getParameter("start"),request.getParameter("end"),request.getParameter("part"));
		List<pieDto> pielist = new ArrayList<pieDto>();
		
		for(int i=0;i<6;i++) {
			pieDto pd=new pieDto();
			pd.setLabel(pie.get(i));
			
			pd.setValue(pie1.get(i));
			pielist.add(pd);
			
		}
		
		return pielist;
	}
	@RequestMapping("/monthall")
	public List monthall(HttpServletRequest request) {
		List<String> pie=mapper.monthallshow(request.getParameter("start"),request.getParameter("end"));
		List<Integer> pie1=mapper.monthallshow1(request.getParameter("start"),request.getParameter("end"));
		List<pieDto> pielist = new ArrayList<pieDto>();
		
		for(int i=0;i<10;i++) {
			pieDto pd=new pieDto();
			pd.setLabel(pie.get(i));
			
			pd.setValue(pie1.get(i));
			pielist.add(pd);
			
		}
		
		return pielist;
	}
	@RequestMapping("/yearall")
	public List monthall() {
		List<String> pie=mapper.yearallshow();
		List<Integer> pie1=mapper.yearallshow1();
		List<pieDto> pielist = new ArrayList<pieDto>();
		
		for(int i=0;i<10;i++) {
			pieDto pd=new pieDto();
			pd.setLabel(pie.get(i));
			
			pd.setValue(pie1.get(i));
			pielist.add(pd);
			
		}
		
		return pielist;
	}
	@RequestMapping("/similarity")
	public  List similarity(HttpServletRequest request) {
		HashMap<Integer, Double> meetings_similar = new HashMap<Integer, Double>();
		
		HashMap<Integer, String> text_data = new HashMap<Integer, String>();
		String text_speech1=mapper.text_speech1(request.getParameter("part"));
		List<String> text_speeches=mapper.text_speeches(request.getParameter("part"));
		List<String> textnum=mapper.text_num(request.getParameter("part"));
		List<MeetingservDto> result = new ArrayList<MeetingservDto>();
		
		for (int i = 0; i < text_speeches.size(); i++) {
			System.out.println(cal_sim(text_speech1, text_speeches.get(i)));
			if(cal_sim(text_speech1, text_speeches.get(i))>0){
				MeetingservDto md;
				md=mapper.Assomeeting_serv(textnum.get(i));
				result.add(md);
				
			}
		}
		
		return result;
		
	}
	public Double cal_sim(String doc1, String doc2) {

		Double ratio = 0.0;
		Double a = 0.0;
		Double b = 0.0;
		Double c = 0.0;
		
		// 전체 단어 목록을 만들기 위해 doc1 doc2 통합
		String doc_total = doc1 + doc2;
				
		// 여기서부터 키워드 추출
		SentenceSplitter sentSplit = new SentenceSplitter();
		List<String> sentences_1 = sentSplit.jSentences(doc1);
		List<String> sentences_2 = sentSplit.jSentences(doc2);
		List<String> sentences_total = sentSplit.jSentences(doc_total);
		
		// return_nouns_verbs는 그냥 명사 동사 추출하는건데 이부분까지는 동규씨 키워드 추출 알고리즘 쓰시면 될것 같아요!
		List<String> terms = return_nouns_verbs(sentences_total);
		terms = remove_stopwords(terms);
		Set<String> terms_unique = new HashSet<String>();
		
		// unique한 단어 집합 만들기
		for (String word : terms) {
			terms_unique.add(word);
		}
		
		// doc1 set doc2 set
		List<String> terms_1 = return_nouns_verbs(sentences_1);
		terms_1 = remove_stopwords(terms_1);
		List<String> terms_2 = return_nouns_verbs(sentences_2);
		terms_2 = remove_stopwords(terms_2);
				
		// 연관도 계산
		for (String term : terms) {
			if (terms_1.contains(term) && terms_2.contains(term)) {
				a = a + 1;
			} else if (terms_1.contains(term) && !terms_2.contains(term)) {
				b = b + 1;
			} else if (!terms_1.contains(term) && terms_2.contains(term)) {
				c = c + 1;
			}
		}
		
		ratio = a/(a+b+c);
		
		//연과도 반환
		return ratio;
	}
	public List<String> return_nouns_verbs(List<String> sentences) {
		//초기화
		List<String> nouns = new ArrayList<String>();
		List<String> verbs = new ArrayList<String>();
		Tagger tagger = new Tagger();
		
		//각 문장별 명사 추출
		for (int i=0; i < sentences.size(); i++  ) {
			kr.bydelta.koala.data.Sentence analyzed = tagger.tagSentence(sentences.get(i));
					
			for (int j=0; j < analyzed.jNouns().size(); j++ ) {
				
				nouns.add(analyzed.jNouns().get(j).toString().split("/")[0].split(" ")[1]);
				
			}
			
			for (int j=0; j < analyzed.jVerbs().size(); j++ ) {
				
				verbs.add(analyzed.jVerbs().get(j).toString().split("/")[0].split(" ")[1]);
				
			}
		}
		List<String> nouns_verbs = new ArrayList<String>(nouns); nouns_verbs.addAll(verbs);
		nouns_verbs = remove_stopwords(nouns_verbs);
		
		return nouns_verbs;
	}	
	public static List<String> remove_stopwords(List<String> words) {
		List<String> stopwords = Arrays.asList("되","보","수","있","!","\"","$","%","&","'","(",")","*","+",",","-",".","...","0","1","2","3","4","5","6","7","8","9",";","<","=",">","?","@","\\","^","_","`","|","~","·","—","——","‘","’","“","”","…","、","。","〈","〉","《","》","가","가까스로","가령","각","각각","각자","각종","갖고말하자면","같다","같이","개의치않고","거니와","거바","거의","것","것과 같이","것들","게다가","게우다","겨우","견지에서","결과에 이르다","결국","결론을 낼 수 있다","겸사겸사","고려하면","고로","곧","공동으로","과","과연","관계가 있다","관계없이","관련이 있다","관하여","관한","관해서는","구","구체적으로","구토하다","그","그들","그때","그래","그래도","그래서","그러나","그러니","그러니까","그러면","그러므로","그러한즉","그런 까닭에","그런데","그런즉","그럼","그럼에도 불구하고","그렇게 함으로써","그렇지","그렇지 않다면","그렇지 않으면","그렇지만","그렇지않으면","그리고","그리하여","그만이다","그에 따르는","그위에","그저","그중에서","그치지 않다","근거로","근거하여","기대여","기점으로","기준으로","기타","까닭으로","까악","까지","까지 미치다","까지도","꽈당","끙끙","끼익","나","나머지는","남들","남짓","너","너희","너희들","네","넷","년","논하지 않다","놀라다","누가 알겠는가","누구","다른","다른 방면으로","다만","다섯","다소","다수","다시 말하자면","다시말하면","다음","다음에","다음으로","단지","답다","당신","당장","대로 하다","대하면","대하여","대해 말하자면","대해서","댕그","더구나","더군다나","더라도","더불어","더욱더","더욱이는","도달하다","도착하다","동시에","동안","된바에야","된이상","두번째로","둘","둥둥","뒤따라","뒤이어","든간에","들","등","등등","딩동","따라","따라서","따위","따지지 않다","딱","때","때가 되어","때문에","또","또한","뚝뚝","라 해도","령","로","로 인하여","로부터","로써","륙","를","마음대로","마저","마저도","마치","막론하고","만 못하다","만약","만약에","만은 아니다","만이 아니다","만일","만큼","말하자면","말할것도 없고","매","매번","메쓰겁다","몇","모","모두","무렵","무릎쓰고","무슨","무엇","무엇때문에","물론","및","바꾸어말하면","바꾸어말하자면","바꾸어서 말하면","바꾸어서 한다면","바꿔 말하면","바로","바와같이","밖에 안된다","반대로","반대로 말하자면","반드시","버금","보는데서","보다더","보드득","본대로","봐","봐라","부류의 사람들","부터","불구하고","불문하고","붕붕","비걱거리다","비교적","비길수 없다","비로소","비록","비슷하다","비추어 보아","비하면","뿐만 아니라","뿐만아니라","뿐이다","삐걱","삐걱거리다","사","삼","상대적으로 말하자면","생각한대로","설령","설마","설사","셋","소생","소인","솨","쉿","습니까","습니다","시각","시간","시작하여","시초에","시키다","실로","심지어","아","아니","아니나다를가","아니라면","아니면","아니었다면","아래윗","아무거나","아무도","아야","아울러","아이","아이고","아이구","아이야","아이쿠","아하","아홉","안 그러면","않기 위하여","않기 위해서","알 수 있다","알았어","앗","앞에서","앞의것","야","약간","양자","어","어기여차","어느","어느 년도","어느것","어느곳","어느때","어느쪽","어느해","어디","어때","어떠한","어떤","어떤것","어떤것들","어떻게","어떻해","어이","어째서","어쨋든","어쩔수 없다","어찌","어찌됏든","어찌됏어","어찌하든지","어찌하여","언제","언젠가","얼마","얼마 안 되는 것","얼마간","얼마나","얼마든지","얼마만큼","얼마큼","엉엉","에","에 가서","에 달려 있다","에 대해","에 있다","에 한하다","에게","에서","여","여기","여덟","여러분","여보시오","여부","여섯","여전히","여차","연관되다","연이서","영","영차","옆사람","예","예를 들면","예를 들자면","예컨대","예하면","오","오로지","오르다","오자마자","오직","오호","오히려","와","와 같은 사람들","와르르","와아","왜","왜냐하면","외에도","요만큼","요만한 것","요만한걸","요컨대","우르르","우리","우리들","우선","우에 종합한것과같이","운운","월","위에서 서술한바와같이","위하여","위해서","윙윙","육","으로","으로 인하여","으로서","으로써","을","응","응당","의","의거하여","의지하여","의해","의해되다","의해서","이","이 되다","이 때문에","이 밖에","이 외에","이 정도의","이것","이곳","이때","이라면","이래","이러이러하다","이러한","이런","이럴정도로","이렇게 많은 것","이렇게되면","이렇게말하자면","이렇구나","이로 인하여","이르기까지","이리하여","이만큼","이번","이봐","이상","이어서","이었다","이와 같다","이와 같은","이와 반대로","이와같다면","이외에도","이용하여","이유만으로","이젠","이지만","이쪽","이천구","이천육","이천칠","이천팔","인 듯하다","인젠","일","일것이다","일곱","일단","일때","일반적으로","일지라도","임에 틀림없다","입각하여","입장에서","잇따라","있다","자","자기","자기집","자마자","자신","잠깐","잠시","저","저것","저것만큼","저기","저쪽","저희","전부","전자","전후","점에서 보아","정도에 이르다","제","제각기","제외하고","조금","조차","조차도","졸졸","좀","좋아","좍좍","주룩주룩","주저하지 않고","줄은 몰랏다","줄은모른다","중에서","중의하나","즈음하여","즉","즉시","지든지","지만","지말고","진짜로","쪽으로","차라리","참","참나","첫번째로","쳇","총적으로","총적으로 말하면","총적으로 보면","칠","콸콸","쾅쾅","쿵","타다","타인","탕탕","토하다","통하여","툭","퉤","틈타","팍","팔","퍽","펄렁","하","하게될것이다","하게하다","하겠는가","하고 있다","하고있었다","하곤하였다","하구나","하기 때문에","하기 위하여","하기는한데","하기만 하면","하기보다는","하기에","하나","하느니","하는 김에","하는 편이 낫다","하는것도","하는것만 못하다","하는것이 낫다","하는바","하더라도","하도다","하도록시키다","하도록하다","하든지","하려고하다","하마터면","하면 할수록","하면된다","하면서","하물며","하여금","하여야","하자마자","하지 않는다면","하지 않도록","하지마","하지마라","하지만","하하","한 까닭에","한 이유는","한 후","한다면","한다면 몰라도","한데","한마디","한적이있다","한켠으로는","한항목","할 따름이다","할 생각이다","할 줄 안다","할 지경이다","할 힘이 있다","할때","할만하다","할망정","할뿐","할수있다","할수있어","할줄알다","할지라도","할지언정","함께","해도된다","해도좋다","해봐요","해서는 안된다","해야한다","해요","했어요","향하다","향하여","향해서","허","허걱","허허","헉","헉헉","헐떡헐떡","형식으로 쓰여","혹시","혹은","혼자","훨씬","휘익","휴","흐흐","흥","힘입어","︿","！","＃","＄","％","＆","（","）","＊","＋","，","０","１","２","３","４","５","６","７","８","９","：","；","＜","＞","？","＠","［","］","｛","｜","｝","～","￥");
				
		words.removeAll(stopwords);
		return words;
	}
	@RequestMapping("/usermeetinglist")
	public List usermeetinglist(HttpServletRequest request) {
		return mapper.meetinguserlist(request.getParameter("part"));
	}
	@RequestMapping("/showsurveyid")
	public List showsurveyid(HttpServletRequest request) {
		return mapper1.showsurvey_result(request.getParameter("part"));
	}
	@RequestMapping("/emotionshow")
	public AnalysisResults emotionshow(HttpServletRequest request) {
		NaturalLanguageUnderstanding service = new NaturalLanguageUnderstanding(
				  NaturalLanguageUnderstanding.VERSION_DATE_2017_02_27,
				  "8841357b-0018-461c-a21e-d40445af8a78",
				  "HTOTHEvjGOi7"
				);
		String result=mapper.textshow(request.getParameter("part"));
				String text = result;

				
			SentimentOptions SentimentOptions =new SentimentOptions.Builder().build();
			ConceptsOptions ConceptsOptions = new ConceptsOptions.Builder().limit(3).build();
				
			 
			
			Features features = new Features.Builder()
				  .concepts(ConceptsOptions)
				  .sentiment(SentimentOptions)
				  .build();

				AnalyzeOptions parameters = new AnalyzeOptions.Builder()
				  .text(text)
				  .features(features)
				  .build();

				AnalysisResults response = service
				  .analyze(parameters)
				  .execute();
				return response;
	}
	@RequestMapping("/assokeyword")
	public List assokeyword(HttpServletRequest request) {
		String text= mapper.textshow(request.getParameter("meeting_id"));
		String Englist_text= Kor_to_Eng(text);
		AnalysisResults Aibril_response= Aibril_NLU(Englist_text);
		ArrayList result = new ArrayList<>();
		ArrayList keywords= Aibril_keywords(Aibril_response);
		ArrayList categories=Aibril_categories(Aibril_response);
		ArrayList concepts= Aibril_concepts(text);
		result.add(keywords);
		result.add(categories);
		result.add(concepts);
		return result;
	}
	public static ArrayList Aibril_categories(AnalysisResults input) {
    	ArrayList Aibril_list = new ArrayList();
    	
  		
  		Aibril_list.add(Eng_to_Kor(input.getCategories().get(0).getLabel()));
  		Aibril_list.add(input.getCategories().get(0).getScore());
    	
    	return Aibril_list;
    }
    
    public static ArrayList Aibril_keywords(AnalysisResults input) {
    	ArrayList Aibril_list = new ArrayList();
    	
  		for(int key=0; key < input.getKeywords().size(); key++) {
  			//String keyword = input.getKeywords().get(key).getText();
  			ArrayList temp = new ArrayList();
  			
  			temp.add(Eng_to_Kor(input.getKeywords().get(key).getText()));
  			temp.add(input.getKeywords().get(key).getRelevance());
  			if (input.getKeywords().get(key).getSentiment().getScore() > 0) temp.add("긍정");
  			else if(input.getKeywords().get(key).getSentiment().getScore() < 0) temp.add("부정");
  			else temp.add("중립");
  			//temp.add(input.getKeywords().get(key).getEmotion());
  			//temp.add(input.getKeywords().get(key).getSentiment().getScore());
  			Aibril_list.add(temp);
  		}
    	
    	return Aibril_list;
    }
    
    public static ArrayList Aibril_concepts(String input) {
    	ArrayList Aibril_list = new ArrayList();
    	
    	NaturalLanguageUnderstanding service = new NaturalLanguageUnderstanding(
    			  NaturalLanguageUnderstanding.VERSION_DATE_2017_02_27,
    			  "8841357b-0018-461c-a21e-d40445af8a78",
    			  "HTOTHEvjGOi7"
        	);
    	ConceptsOptions concepts= new ConceptsOptions.Builder().limit(2).build();
    	Features features = new Features.Builder()
  			  .concepts(concepts)
  			  .build();
    	
		AnalyzeOptions parameters = new AnalyzeOptions.Builder()
				  .text(input)
				  .features(features)
				  .build();
		
		AnalysisResults response = service
				  .analyze(parameters)
				  .execute();
		
  		for(int key=0; key < response.getConcepts().size(); key++) {	
  			ArrayList temp = new ArrayList();
  			temp.add(response.getConcepts().get(key).getText());
  			temp.add(response.getConcepts().get(key).getRelevance());
  			Aibril_list.add(temp);
  		}
    	
    	return Aibril_list;
    }
    
    
    public static AnalysisResults Aibril_NLU(String input) {
    	NaturalLanguageUnderstanding service = new NaturalLanguageUnderstanding(
  			  NaturalLanguageUnderstanding.VERSION_DATE_2017_02_27,
  			  "8841357b-0018-461c-a21e-d40445af8a78",
  			  "HTOTHEvjGOi7"
      	);

    	CategoriesOptions categories = new CategoriesOptions();
    	KeywordsOptions keywords = new KeywordsOptions.Builder()
    			.limit(20)
    			//.emotion(true)
    			.sentiment(true)
    			.build();

    	Features features = new Features.Builder()
    			  .categories(categories)
    			  .keywords(keywords)
    			  .build();

		AnalyzeOptions parameters = new AnalyzeOptions.Builder()
		  .text(input)
		  .features(features)
		  .build();

		AnalysisResults response = service
		  .analyze(parameters)
		  .execute();
    		
    	return response;
    }
    
    public static String Kor_to_Eng(String input) {
    	String myKey = "AIzaSyBQh-yGwGpTfGIGGrB3TZBT7K-tY4iWNec";
    	Translate translate = TranslateOptions.newBuilder().setApiKey(myKey).build().getService();
    	
    	Translation translation = translate.translate(
    			input,
    	        TranslateOption.sourceLanguage("ko"),
    	        TranslateOption.targetLanguage("en")
    	);
    	
    	return translation.getTranslatedText();
    }
    
    public static String Eng_to_Kor(String input) {
    	String myKey = "AIzaSyBQh-yGwGpTfGIGGrB3TZBT7K-tY4iWNec";
    	Translate translate = TranslateOptions.newBuilder().setApiKey(myKey).build().getService();
    	
    	Translation translation = translate.translate(
    			input,
    	        TranslateOption.sourceLanguage("en"),
    	        TranslateOption.targetLanguage("ko")
    	);
    	
    	return translation.getTranslatedText();
    }

}
